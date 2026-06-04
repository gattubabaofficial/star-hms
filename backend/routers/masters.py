from typing import List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from backend.database import get_db
from backend.models.auth import UserMast
from backend.models.masters import (
    AreaMast, DoctCatgMst, DoctRoleMst, DoctMast, 
    RefCatgMst, RefByMast, RefToMast, PatCatgMst, PatMast,
    StsnMast, FloorMast, WardMast, BedMast,
    ServGrpMst, ServMast, DiagMast, ServRateMst, DiagSrvMst, BedSrvMst, PartyGrpMst, PartyMast, SubItmGrpMst, SubItmMast
)


from backend.schemas.masters import (
    AreaMastCreate, AreaMastUpdate, AreaMastResponse,
    DoctCatgMstCreate, DoctCatgMstUpdate, DoctCatgMstResponse,
    DoctRoleMstCreate, DoctRoleMstUpdate, DoctRoleMstResponse,
    DoctMastCreate, DoctMastUpdate, DoctMastResponse,
    RefCatgMstCreate, RefCatgMstUpdate, RefCatgMstResponse,
    RefByMastCreate, RefByMastUpdate, RefByMastResponse,
    RefToMastCreate, RefToMastUpdate, RefToMastResponse,
    PatCatgMstCreate, PatCatgMstUpdate, PatCatgMstResponse,
    PatMastCreate, PatMastUpdate, PatMastResponse,
    StsnMastCreate, StsnMastUpdate, StsnMastResponse,
    FloorMastCreate, FloorMastUpdate, FloorMastResponse,
    WardMastCreate, WardMastUpdate, WardMastResponse,
    BedMastCreate, BedMastUpdate, BedMastResponse,
    RoomLayoutCreate,
    ServGrpMstCreate, ServGrpMstUpdate, ServGrpMstResponse,
    ServMastCreate, ServMastUpdate, ServMastResponse,
    DiagMastCreate, DiagMastUpdate, DiagMastResponse,
    ServRateMstCreate, ServRateMstUpdate, ServRateMstResponse,
    DiagSrvMstCreate, DiagSrvMstUpdate, DiagSrvMstResponse,
    BedSrvMstCreate, BedSrvMstUpdate, BedSrvMstResponse,
    PartyGrpMstCreate, PartyGrpMstUpdate, PartyGrpMstResponse,
    PartyMastCreate, PartyMastUpdate, PartyMastResponse,
    SubItmGrpMstCreate, SubItmGrpMstUpdate, SubItmGrpMstResponse,
    SubItmMastCreate, SubItmMastUpdate, SubItmMastResponse
)


from backend.core.dependencies import get_current_active_user, get_db as dep_get_db

def _create_crud_routes(router, path, model, schema_create, schema_update, schema_response, pk_col_name, pk_col):
    @router.get(path, response_model=List[schema_response])
    def get_all(skip: int = 0, limit: int = 100, db: Session = Depends(dep_get_db), current_user: UserMast = Depends(get_current_active_user)):
        rec_state_col = getattr(model, pk_col_name.replace("Code", "RecState").replace("Ara", "Ara").replace("Dcg", "Dcg").replace("Drl", "Drl").replace("Dct", "Dct").replace("Rfg", "Rfg").replace("RBy", "RBy").replace("RTo", "RTo").replace("Pcg", "Pcg").replace("Ptt", "Ptt"))
        return db.query(model).filter(rec_state_col == 1).offset(skip).limit(limit).all()

    @router.post(path, response_model=schema_response)
    def create(item: schema_create, db: Session = Depends(dep_get_db), current_user: UserMast = Depends(get_current_active_user)):
        db_item = model(**item.model_dump())
        db.add(db_item)
        db.commit()
        db.refresh(db_item)
        return db_item

    @router.put(f"{path}/{{pk_val}}", response_model=schema_response)
    def update(pk_val: int, item: schema_update, db: Session = Depends(dep_get_db), current_user: UserMast = Depends(get_current_active_user)):
        db_item = db.query(model).filter(pk_col == pk_val).first()
        if not db_item:
            raise HTTPException(status_code=404, detail="Not found")
        for key, value in item.model_dump().items():
            setattr(db_item, key, value)
        db.commit()
        db.refresh(db_item)
        return db_item

    @router.delete(f"{path}/{{pk_val}}")
    def delete(pk_val: int, db: Session = Depends(dep_get_db), current_user: UserMast = Depends(get_current_active_user)):
        db_item = db.query(model).filter(pk_col == pk_val).first()
        if not db_item:
            raise HTTPException(status_code=404, detail="Not found")
        rec_state_col_name = pk_col_name.replace("Code", "RecState").replace("Ara", "Ara").replace("Dcg", "Dcg").replace("Drl", "Drl").replace("Dct", "Dct").replace("Rfg", "Rfg").replace("RBy", "RBy").replace("RTo", "RTo").replace("Pcg", "Pcg").replace("Ptt", "Ptt")
        setattr(db_item, rec_state_col_name, 0)
        db.commit()
        return {"ok": True}

router = APIRouter()

# ---------------------------------------------------------
# AREA MASTER CRUD
# ---------------------------------------------------------

@router.get("/areas", response_model=List[AreaMastResponse])
def get_areas(
    skip: int = 0, limit: int = 100, 
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    areas = db.query(AreaMast).filter(AreaMast.AraRecState == 1).offset(skip).limit(limit).all()
    return areas

@router.post("/areas", response_model=AreaMastResponse)
def create_area(
    area: AreaMastCreate, 
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    # Depending on RBAC, check if user has 'can_add' for AreaMast
    db_area = AreaMast(**area.model_dump())
    db.add(db_area)
    db.commit()
    db.refresh(db_area)
    return db_area

@router.put("/areas/{ara_code}", response_model=AreaMastResponse)
def update_area(
    ara_code: int, 
    area: AreaMastUpdate, 
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_area = db.query(AreaMast).filter(AreaMast.AraCode == ara_code).first()
    if not db_area:
        raise HTTPException(status_code=404, detail="Area not found")
    
    for key, value in area.model_dump().items():
        setattr(db_area, key, value)
    
    db.commit()
    db.refresh(db_area)
    return db_area

@router.delete("/areas/{ara_code}")
def delete_area(
    ara_code: int, 
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_area = db.query(AreaMast).filter(AreaMast.AraCode == ara_code).first()
    if not db_area:
        raise HTTPException(status_code=404, detail="Area not found")
    
    # Soft delete
    db_area.AraRecState = 0
    db.commit()
    return {"ok": True}

# Generate routes for Group 1 models
_create_crud_routes(router, "/doct-categories", DoctCatgMst, DoctCatgMstCreate, DoctCatgMstUpdate, DoctCatgMstResponse, "DcgCode", DoctCatgMst.DcgCode)
_create_crud_routes(router, "/doct-roles", DoctRoleMst, DoctRoleMstCreate, DoctRoleMstUpdate, DoctRoleMstResponse, "DrlCode", DoctRoleMst.DrlCode)
_create_crud_routes(router, "/doctors", DoctMast, DoctMastCreate, DoctMastUpdate, DoctMastResponse, "DctCode", DoctMast.DctCode)
_create_crud_routes(router, "/ref-categories", RefCatgMst, RefCatgMstCreate, RefCatgMstUpdate, RefCatgMstResponse, "RfgCode", RefCatgMst.RfgCode)
_create_crud_routes(router, "/ref-bys", RefByMast, RefByMastCreate, RefByMastUpdate, RefByMastResponse, "RByCode", RefByMast.RByCode)
_create_crud_routes(router, "/ref-tos", RefToMast, RefToMastCreate, RefToMastUpdate, RefToMastResponse, "RToCode", RefToMast.RToCode)
_create_crud_routes(router, "/pat-categories", PatCatgMst, PatCatgMstCreate, PatCatgMstUpdate, PatCatgMstResponse, "PcgCode", PatCatgMst.PcgCode)
_create_crud_routes(router, "/patients", PatMast, PatMastCreate, PatMastUpdate, PatMastResponse, "PttCode", PatMast.PttCode)

# Group 2 (Locations & Facilities)
_create_crud_routes(router, "/stations", StsnMast, StsnMastCreate, StsnMastUpdate, StsnMastResponse, "StnCode", StsnMast.StnCode)
_create_crud_routes(router, "/floors", FloorMast, FloorMastCreate, FloorMastUpdate, FloorMastResponse, "FlrCode", FloorMast.FlrCode)
_create_crud_routes(router, "/wards", WardMast, WardMastCreate, WardMastUpdate, WardMastResponse, "WrdCode", WardMast.WrdCode)
_create_crud_routes(router, "/beds", BedMast, BedMastCreate, BedMastUpdate, BedMastResponse, "BdmCode", BedMast.BdmCode)

# Group 3 (Services & Investigations)
_create_crud_routes(router, "/service-groups", ServGrpMst, ServGrpMstCreate, ServGrpMstUpdate, ServGrpMstResponse, "SgpCode", ServGrpMst.SgpCode)
_create_crud_routes(router, "/diagnostics", DiagMast, DiagMastCreate, DiagMastUpdate, DiagMastResponse, "DigCode", DiagMast.DigCode)
_create_crud_routes(router, "/service-rates", ServRateMst, ServRateMstCreate, ServRateMstUpdate, ServRateMstResponse, "SrmCode", ServRateMst.SrmCode)

# Phase 2 Masters
_create_crud_routes(router, "/party-groups", PartyGrpMst, PartyGrpMstCreate, PartyGrpMstUpdate, PartyGrpMstResponse, "PgmCode", PartyGrpMst.PgmCode)
_create_crud_routes(router, "/parties", PartyMast, PartyMastCreate, PartyMastUpdate, PartyMastResponse, "PrtCode", PartyMast.PrtCode)
_create_crud_routes(router, "/subitem-groups", SubItmGrpMst, SubItmGrpMstCreate, SubItmGrpMstUpdate, SubItmGrpMstResponse, "SigCode", SubItmGrpMst.SigCode)
_create_crud_routes(router, "/subitems", SubItmMast, SubItmMastCreate, SubItmMastUpdate, SubItmMastResponse, "SimCode", SubItmMast.SimCode)
_create_crud_routes(router, "/bed-services", BedSrvMst, BedSrvMstCreate, BedSrvMstUpdate, BedSrvMstResponse, "BsmICode", BedSrvMst.BsmICode)
_create_crud_routes(router, "/services", ServMast, ServMastCreate, ServMastUpdate, ServMastResponse, "SrvCode", ServMast.SrvCode)
_create_crud_routes(router, "/serv-rates", ServRateMst, ServRateMstCreate, ServRateMstUpdate, ServRateMstResponse, "SrmCode", ServRateMst.SrmCode)

@router.post("/room-layout")
def create_room_layout(layout: RoomLayoutCreate, db: Session = Depends(get_db)):
    # Find or create Floor
    floor = db.query(FloorMast).filter(FloorMast.FlrName.ilike(layout.floor_name)).first()
    if not floor:
        floor = FloorMast(FlrName=layout.floor_name, FlrRecState=1)
        db.add(floor)
        db.flush()

    # Find or create Ward
    ward = db.query(WardMast).filter(WardMast.WrdName.ilike(layout.ward_name)).first()
    if not ward:
        ward = WardMast(WrdName=layout.ward_name, WrdRecState=1)
        db.add(ward)
        db.flush()

    # Find the current max index for beds in this ward to continue numbering
    existing_beds = db.query(BedMast).filter(
        BedMast.BdmFlrCode == floor.FlrCode,
        BedMast.BdmWrdCode == ward.WrdCode
    ).count()

    # Create beds
    new_beds = []
    for i in range(1, layout.num_beds + 1):
        bed_name = f"Bed-{existing_beds + i:02d}"
        new_bed = BedMast(
            BdmName=bed_name,
            BdmFlrCode=floor.FlrCode,
            BdmWrdCode=ward.WrdCode,
            BdmCharges=500.0,
            BdmRecState=1,
            BdmIndex=existing_beds + i
        )
        db.add(new_bed)
        new_beds.append(new_bed)

    db.commit()
    return {"message": f"Successfully created {layout.num_beds} beds in {layout.floor_name} - {layout.ward_name}"}

# Custom routes for Service Rates
@router.get("/service-rates/{srv_code}", response_model=List[ServRateMstResponse])
def get_service_rates(
    srv_code: int,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    rates = db.query(ServRateMst).filter(
        ServRateMst.SrmSrvCode == srv_code,
        ServRateMst.SrmRecState == 1
    ).all()
    return rates

@router.post("/service-rates", response_model=ServRateMstResponse)
def create_service_rate(
    rate: ServRateMstCreate,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_rate = ServRateMst(**rate.model_dump())
    db.add(db_rate)
    db.commit()
    db.refresh(db_rate)
    return db_rate

@router.put("/service-rates/{srm_code}", response_model=ServRateMstResponse)
def update_service_rate(
    srm_code: int,
    rate: ServRateMstUpdate,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_rate = db.query(ServRateMst).filter(ServRateMst.SrmCode == srm_code).first()
    if not db_rate:
        raise HTTPException(status_code=404, detail="Service rate not found")
    
    for key, value in rate.model_dump().items():
        setattr(db_rate, key, value)
    
    db.commit()
    db.refresh(db_rate)
    return db_rate

@router.delete("/service-rates/{srm_code}")
def delete_service_rate(
    srm_code: int,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_rate = db.query(ServRateMst).filter(ServRateMst.SrmCode == srm_code).first()
    if not db_rate:
        raise HTTPException(status_code=404, detail="Service rate not found")
    
    db_rate.SrmRecState = 0
    db.commit()
    return {"ok": True}

# Custom routes for Diagnostic Services
@router.get("/diag-services/{dig_code}", response_model=List[DiagSrvMstResponse])
def get_diag_services(
    dig_code: int,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    return db.query(DiagSrvMst).filter(DiagSrvMst.DsmDigCode == dig_code).all()

@router.post("/diag-services", response_model=DiagSrvMstResponse)
def create_diag_service(
    srv: DiagSrvMstCreate,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_srv = DiagSrvMst(**srv.model_dump())
    db.add(db_srv)
    db.commit()
    db.refresh(db_srv)
    return db_srv

@router.delete("/diag-services/{dsm_code}")
def delete_diag_service(
    dsm_code: int,
    db: Session = Depends(dep_get_db),
    current_user: UserMast = Depends(get_current_active_user)
):
    db_srv = db.query(DiagSrvMst).filter(DiagSrvMst.DsmCode == dsm_code).first()
    if not db_srv:
        raise HTTPException(status_code=404, detail="Diagnostic service not found")
    
    db.delete(db_srv)
    db.commit()
    return {"ok": True}
