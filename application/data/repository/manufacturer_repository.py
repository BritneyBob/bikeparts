from application.data.db import session
from application.data.models.manufacturer import Manufacturer


def create_manufacturer(manufacturer):
    manufacturer = Manufacturer(**manufacturer)
    session.add(manufacturer)
    session.commit()
