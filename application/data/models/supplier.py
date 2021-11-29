from sqlalchemy import Integer, String, Column

from application.data.db import Base


class Supplier(Base):
    __tablename__ = "suppliers"

    supplier_id = Column(Integer, primary_key=True, autoincrement=True)
    company_id = Column(Integer, foreign_key)