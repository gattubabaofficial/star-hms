import os
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str = os.getenv("DATABASE_URL", "postgresql://postgres:postgres@localhost:5432/star-hms")
    JWT_SECRET: str = os.getenv("JWT_SECRET", "hms-secret-key-change-in-production")
    JWT_EXPIRES_IN: str = os.getenv("JWT_EXPIRES_IN", "24h")
    SYNC_API_KEY: str = os.getenv("SYNC_API_KEY", "hms-sync-secret-key")

    @property
    def sqlalchemy_database_url(self) -> str:
        url = self.DATABASE_URL
        # If the URL is for postgresql but doesn't specify a driver, inject pg8000
        if url.startswith("postgresql://"):
            return url.replace("postgresql://", "postgresql+pg8000://", 1)
        elif url.startswith("postgres://"):
            return url.replace("postgres://", "postgresql+pg8000://", 1)
        return url

settings = Settings()
