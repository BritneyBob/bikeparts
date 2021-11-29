from sqlalchemy import Integer, Column, ForeignKey

from bikeparts.application.data.db import Base


class CarModelsHaveSparParts(Base):
    __tablename__ = "car_models_have_spare_parts"

    car_model_id = Column(Integer, ForeignKey('car_models.car_model_id'), primary_key=True, nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
