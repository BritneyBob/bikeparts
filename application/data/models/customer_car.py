from sqlalchemy import Integer, String, Column

from application.data.db import Base


class CustomerCar(Base):
    __tablename__ = "customer_cars"

    license_number = Column(String(6), primary_key=True, autoincrement=True)
    store_id = Column(Integer, foreign_key)
    car_model_id = Column(Integer, foreign_key)
    color = Column(String(20), nullable=False)
