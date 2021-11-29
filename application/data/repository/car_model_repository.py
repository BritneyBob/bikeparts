from application.data.db import session
from application.data.models.car_model import CarModel


def create_car_model(car_model):
    car_model = CarModel(**car_model)
    session.add(car_model)
    session.commit()
