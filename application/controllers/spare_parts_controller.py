from application.data.repository import spare_parts_repository as spr


def get_spare_parts():
    return spr.get_spare_parts()
