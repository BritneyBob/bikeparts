from application.data.db import session
from application.data.models import CarModel, car_models_have_spare_parts_table


def create_car_model(car_model):
    car_model = CarModel(**car_model)
    session.add(car_model)
    session.commit()


def create_car_model_spare_part(car_model, spare_part):
    statement = car_models_have_spare_parts_table.insert().values(car_model_id=car_model, product_number=spare_part)
    session.execute(statement)
    session.commit()


def get_car_model_by_id(car_model_id):
    x = session.query(CarModel).filter(CarModel.car_model_id == car_model_id).first()
    return x