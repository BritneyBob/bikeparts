from application.controllers.spare_parts_controller import get_spare_parts


def show_all_spare_parts():
    spare_parts = get_spare_parts()
    for spare_part in spare_parts:
        print(spare_part)
