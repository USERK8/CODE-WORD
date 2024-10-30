<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.web.FeedbackDAO" %>
<%@ page import="com.example.web.Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
        /* Your styles here */
    </style>
</head>
<body>
    <h1>HELLO THERE,</h1>
    <p>I AM SOHAN, THE CREATOR OF THIS WEBPAGE...</p>
    
    <div class="feedback-form">
        <h2>Send Us Your Feedback</h2>
        <form action="FeedbackServlet" method="POST">
            <textarea name="message" id="message" placeholder="Type your feedback here..." required></textarea><br><br>
            <input type="submit" value="Send Feedback">
        </form>
    </div>

    <h2>Feedback of Other Users</h2>
    <div class="feedback-box">
        <%
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            List<Feedback> feedbacks = feedbackDAO.getAllFeedbacks();

            for (Feedback feedback : feedbacks) {
        %>
            <div class="feedback-item">
                <p><strong>Message:</strong> <%= feedback.getMessage() %></p>
                <p><strong>Likes:</strong> <%= feedback.getLikes() %> <button onclick="likeFeedback(<%= feedback.getId() %>)">👍</button></p>
                <p><strong>Dislikes:</strong> <%= feedback.getDislikes() %> <button onclick="dislikeFeedback(<%= feedback.getId() %>)">👎</button></p>
                <button onclick="showReplyBox(<%= feedback.getId() %>)">Reply</button>
                <div id="replyBox<%= feedback.getId() %>" style="display:none;">
                    <textarea placeholder="Type your reply here..."></textarea>
                    <button>Send Reply</button>
                </div>
            </div>
        <%
            }
        %>
    </div>

    <script>
        function showReplyBox(feedbackId) {
            const replyBox = document.getElementById("replyBox" + feedbackId);
            replyBox.style.display = replyBox.style.display === "none" ? "block" : "none";
        }

        function likeFeedback(feedbackId) {
            // Implement like logic (e.g., send AJAX request to the server)
        }

        function dislikeFeedback(feedbackId) {
            // Implement dislike logic (e.g., send AJAX request to the server)
        }
    </script>
</body>
</html>
