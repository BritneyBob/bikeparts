from sqlalchemy import Integer, String, Column

from application.data.db import Base


class Company(Base):
    __tablename__ = "companies"  # den här håller koll på vilken tabell vi matchar

    company_id = Column(Integer, primary_key=True, autoincrement=True)
    company_name = Column(String(100), nullable=False)
    contact = Column(String(100), nullable=False)
    contact_phonenumber = Column(String(20), nullable=False)
    contact_email = Column(String(100), nullable=False)