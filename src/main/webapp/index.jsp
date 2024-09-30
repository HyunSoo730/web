<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Completion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        #result {
            margin-top: 20px;
            padding: 15px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">AI Completion</h2>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="messageInput" placeholder="Enter your message">
            <button class="btn btn-primary" onclick="getCompletion()">Get Completion</button>
        </div>
        <div id="result" class="d-none"></div>
    </div>

    <script>
    function getCompletion() {
        var message = $('#messageInput').val();
        $.ajax({
            url: 'http://localhost:9090/ai',
            type: 'GET',
            data: { message: message },
            dataType: 'json',
            success: function(response) {
                $('#result').text(response.completion).removeClass('d-none');
            },
            error: function(xhr, status, error) {
                $('#result').text('Error: ' + error).removeClass('d-none');
            }
        });
    }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
