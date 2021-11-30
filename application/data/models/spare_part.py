from sqlalchemy import Integer, String, Column, Float

from application.data.db import Base


class SparePart(Base):
    __tablename__ = "spare_parts"

    product_number = Column(Integer, primary_key=True, nullable=False)
    name = Column(String(100), nullable=False)
    description = Column(String(250), nullable=False)
    sell_price = Column(Float, nullable=False)
