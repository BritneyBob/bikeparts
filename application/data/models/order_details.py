from sqlalchemy import Integer, Column, Numeric, ForeignKey

from bikeparts.application.data.db import Base


class OrderDetails(Base):
    __tablename__ = "order_details"

    customer_order_number = Column(Integer, ForeignKey('customer_orders.customer_order_number'), primary_key=True,
                                   nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    price_each = Column(Numeric, nullable=False)
    quantity_ordered = Column(Integer, nullable=False)
