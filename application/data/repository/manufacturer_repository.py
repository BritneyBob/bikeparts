from application.data.db import session
from application.data.models import Manufacturer, spare_parts_have_manufacturers_table


def create_manufacturer(manufacturer):
    manufacturer = Manufacturer(**manufacturer)
    session.add(manufacturer)
    session.commit()


def get_manufacturers():
    manufacturer = session.query(Manufacturer).all()
    return manufacturer
