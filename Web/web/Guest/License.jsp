<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Go-Between</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div id="tab" class="container mt-5">
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/LicenseUploadAction.jsp" class="border p-4 rounded"> 
            <h1 class="mb-4">License Details</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txt_number">Number</label>
                        <input type="text" class="form-control" id="txt_number" maxlength="16" name="txt_number">
                    </div>
                    <div class="form-group">
                        <label for="file_front">Front Photo</label>
                        <input type="file" class="form-control-file" id="file_front" name="file_front">
                    </div>
                    <div class="form-group">
                        <label for="file_back">Back Photo</label>
                        <input type="file" class="form-control-file" id="file_back" name="file_back">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="txt_class">Class</label>
                        <input type="text" class="form-control" id="txt_class" name="txt_class">
                    </div>
                    <div class="form-group">
                        <label for="date_issue">Issued Date</label>
                        <input type="date" class="form-control" id="date_issue" name="date_issue">
                        <input type="hidden" name="txt_id" value="<%=request.getParameter("id")%>">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" name="btn_submit">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS (Optional, if you need JavaScript features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
