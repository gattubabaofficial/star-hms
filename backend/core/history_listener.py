import datetime
from sqlalchemy import event

def make_log(mapper, connection, target, action):
    """
    Creates a log entry in the corresponding _Log table when a target object is modified.
    """
    cls_name = target.__class__.__name__ + "_Log"
    
    # SQLAlchemy 2.0 uses registry._class_registry 
    # Or we can just use the target.__class__.__subclasses__() or Base.registry.
    # A safer way to find the log class table:
    # Look through the metadata
    log_table_name = target.__tablename__ + "_Log"
    metadata = target.__class__.metadata
    
    if log_table_name not in metadata.tables:
        return
        
    log_table = metadata.tables[log_table_name]
    
    data = {}
    for column in log_table.columns:
        if column.name == 'LogAction':
            data[column.name] = action
        elif column.name == 'LogDate':
            data[column.name] = datetime.datetime.now()
        elif column.name != 'LogId':
            if hasattr(target, column.name):
                data[column.name] = getattr(target, column.name)
                
    # Use the active connection to insert the log row directly
    connection.execute(log_table.insert().values(**data))


def setup_history_listeners(Base):
    """
    Attach listeners to all mapped classes that have a corresponding _Log table.
    """
    for mapper in Base.registry.mappers:
        cls = mapper.class_
        if hasattr(cls, '__tablename__') and not cls.__name__.endswith('_Log'):
            # Only listen if a _Log table exists
            log_table_name = cls.__tablename__ + "_Log"
            if log_table_name in cls.metadata.tables:
                event.listen(cls, 'after_insert', lambda m, c, t: make_log(m, c, t, 'INSERT'))
                event.listen(cls, 'after_update', lambda m, c, t: make_log(m, c, t, 'UPDATE'))
                event.listen(cls, 'after_delete', lambda m, c, t: make_log(m, c, t, 'DELETE'))
