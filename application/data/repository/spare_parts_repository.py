from application.data.db import session
from application.data.models import SparePart

def get_spare_parts():
    return session.query(SparePart).all()