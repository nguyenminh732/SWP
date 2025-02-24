<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book a Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .booking-card {
            transition: transform 0.2s;
        }
        .booking-card:hover {
            transform: translateY(-5px);
        }
        #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1000;
        }
        #loadingSpinner {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 1001;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Loading overlay -->
    <div id="overlay"></div>
    <div id="loadingSpinner" class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>

    <div class="container py-5">
        <div class="row">
            <!-- Booking Form -->
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title mb-4">Book a Table</h3>
                        
                        <!-- Alert Messages -->
                        <div id="alertMessages"></div>
                        
                        <form id="bookingForm" onsubmit="return submitBooking(event);">
                            <div class="mb-3">
                                <label for="bookingDate" class="form-label">Date</label>
                                <input type="date" class="form-control" id="bookingDate" name="bookingDate" 
                                       required min="${today}">
                            </div>
                            
                            <div class="mb-3">
                                <label for="bookingTime" class="form-label">Time</label>
                                <input type="time" class="form-control" id="bookingTime" name="bookingTime" 
                                       required min="09:00" max="22:00">
                            </div>
                            
                            <div class="mb-3">
                                <label for="numberOfGuests" class="form-label">Number of Guests</label>
                                <input type="number" class="form-control" id="numberOfGuests" name="numberOfGuests" 
                                       required min="1" max="10">
                            </div>
                            
                            <div class="mb-3">
                                <label for="notes" class="form-label">Special Requests</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-calendar-check"></i> Book Now
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- My Bookings -->
            <div class="col-md-6" id="myBookings">
                <jsp:include page="/WEB-INF/partials/bookings-list.jsp" />
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showLoading() {
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('loadingSpinner').style.display = 'block';
        }

        function hideLoading() {
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('loadingSpinner').style.display = 'none';
        }

        function showAlert(message, type) {
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
            alertDiv.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;
            document.getElementById('alertMessages').appendChild(alertDiv);
            
            // Auto-dismiss after 5 seconds
            setTimeout(() => {
                alertDiv.remove();
            }, 5000);
        }

        function updateBookingsList(html) {
            const bookingsDiv = document.getElementById('myBookings');
            if (bookingsDiv) {
                bookingsDiv.innerHTML = html;
            } else {
                console.error('Could not find myBookings div');
            }
        }

        async function submitBooking(event) {
            event.preventDefault();
            showLoading();

            try {
                const form = event.target;
                const formData = new FormData(form);

                console.log('Submitting booking form...');
                
                // Submit booking
                const response = await fetch('${pageContext.request.contextPath}/booking', {
                    method: 'POST',
                    body: formData
                });

                console.log('Response status:', response.status);
                const responseText = await response.text();
                console.log('Response text:', responseText);

                let jsonResponse;
                try {
                    jsonResponse = JSON.parse(responseText);
                } catch (e) {
                    console.error('Failed to parse JSON response:', e);
                    throw new Error('Invalid server response');
                }

                if (!response.ok) {
                    throw new Error(jsonResponse.message || 'Server error');
                }

                if (jsonResponse.success) {
                    // Get updated bookings list
                    console.log('Getting updated bookings list...');
                    const bookingsResponse = await fetch('${pageContext.request.contextPath}/booking?ajax=true');
                    const bookingsHtml = await bookingsResponse.text();
                    console.log('Received bookings HTML');
                    
                    // Update the bookings section
                    updateBookingsList(bookingsHtml);
                    
                    // Show success message
                    showAlert(jsonResponse.message, 'success');
                    
                    // Reset form
                    form.reset();
                } else {
                    showAlert(jsonResponse.message, 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('Error creating booking: ' + error.message, 'danger');
            } finally {
                hideLoading();
            }

            return false;
        }

        async function cancelBooking(bookingId) {
            if (!confirm('Are you sure you want to cancel this booking?')) {
                return;
            }

            showLoading();

            try {
                const formData = new FormData();
                formData.append('action', 'cancel');
                formData.append('bookingId', bookingId);

                const response = await fetch('${pageContext.request.contextPath}/booking', {
                    method: 'POST',
                    body: formData
                });

                const jsonResponse = await response.json();

                if (!response.ok) {
                    throw new Error(jsonResponse.message || 'Server error');
                }

                if (jsonResponse.success) {
                    // Get updated bookings list
                    const bookingsResponse = await fetch('${pageContext.request.contextPath}/booking?ajax=true');
                    const bookingsHtml = await bookingsResponse.text();
                    
                    // Update the bookings section
                    updateBookingsList(bookingsHtml);
                    
                    // Show success message
                    showAlert(jsonResponse.message, 'success');
                } else {
                    showAlert(jsonResponse.message, 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('Error cancelling booking: ' + error.message, 'danger');
            } finally {
                hideLoading();
            }
        }

        // Add console logs for debugging
        document.addEventListener('DOMContentLoaded', function() {
            console.log('Page loaded');
            const form = document.getElementById('bookingForm');
            if (form) {
                console.log('Found booking form');
                form.addEventListener('submit', function(e) {
                    console.log('Form submitted');
                    submitBooking(e);
                });
            } else {
                console.error('Could not find booking form');
            }
        });
    </script>
</body>
</html>
