from sqlalchemy import Integer, Column, Numeric, ForeignKey
from sqlalchemy.orm import relationship

from application.data.db import Base


class OrderDetail(Base):
    __tablename__ = "order_details"

    customer_order_number = Column(Integer, ForeignKey('customer_orders.customer_order_number'), primary_key=True,
                                   nullable=False)
    product_number = Column(Integer, ForeignKey('spare_parts.product_number'), primary_key=True, nullable=False)
    price_each = Column(Numeric, nullable=False)
    quantity_ordered = Column(Integer, nullable=False)
    customer_orders = relationship("CustomerOrder", back_populates="spare_parts")
    spare_parts = relationship("SparePart", back_populates="customer_orders")
