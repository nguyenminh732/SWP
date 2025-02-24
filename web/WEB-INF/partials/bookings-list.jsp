<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-12">
    <h3 class="mb-4">My Bookings</h3>
    
    <c:if test="${not empty bookings}">
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach items="${bookings}" var="booking">
                <div class="col">
                    <div class="card h-100 booking-card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <h5 class="card-title mb-0">
                                    Table ${booking.tableNumber}
                                    <small class="text-muted">(${booking.tableCapacity} seats)</small>
                                </h5>
                                <span class="badge rounded-pill 
                                    ${booking.status eq 'Confirmed' ? 'bg-success' : 
                                      booking.status eq 'Pending' ? 'bg-warning' : 
                                      booking.status eq 'Cancelled' ? 'bg-danger' : 'bg-secondary'}
                                    status-badge">
                                    ${booking.status}
                                </span>
                            </div>
                            
                            <p class="card-text">
                                <i class="far fa-calendar"></i> 
                                <fmt:formatDate value="${booking.bookingDate}" pattern="EEEE, MMMM d, yyyy"/>
                                <br>
                                <i class="far fa-clock"></i> 
                                <fmt:formatDate value="${booking.bookingTime}" pattern="h:mm a"/>
                                <br>
                                <i class="fas fa-users"></i> ${booking.numberOfGuests} guests
                                <c:if test="${not empty booking.notes}">
                                    <br>
                                    <i class="far fa-comment"></i> ${booking.notes}
                                </c:if>
                            </p>
                            
                            <c:if test="${booking.status ne 'Cancelled' and booking.status ne 'Completed'}">
                                <button type="button" class="btn btn-danger btn-sm" 
                                        onclick="cancelBooking(${booking.bookingId})">
                                    <i class="fas fa-times"></i> Cancel Booking
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    
    <c:if test="${empty bookings}">
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> You don't have any bookings yet.
        </div>
    </c:if>
</div>
