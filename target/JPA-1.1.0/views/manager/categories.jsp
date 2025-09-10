<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý danh mục - Manager</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #667eea;
            --primary-hover: #5a67d8;
            --secondary: #8B5FBF;
            --success: #10B981;
            --danger: #EF4444;
            --warning: #F59E0B;
            --light: #F8FAFC;
            --dark: #2D3748;
            --gray: #A0AEC0;
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            --gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 30px;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--light);
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: inline-block;
        }

        .role-badge {
            background: var(--gradient);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
        }

        .search-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .search-box {
            display: flex;
            gap: 12px;
            flex: 1;
            max-width: 400px;
        }

        input[type="text"] {
            padding: 12px 16px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            flex: 1;
            font-size: 14px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        input[type="text"]:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.3);
            outline: none;
            background: white;
        }

        button {
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .search-btn {
            background: var(--primary);
            color: white;
        }

        .search-btn:hover {
            background: var(--primary-hover);
        }

        .add-btn {
            background: var(--success);
            color: white;
        }

        .add-btn:hover {
            background: #0d9663;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        th {
            background: rgba(102, 126, 234, 0.1);
            font-weight: 600;
            color: var(--dark);
            position: sticky;
            top: 0;
        }

        tr {
            transition: all 0.3s ease;
        }

        tr:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: translateY(-1px);
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .update-btn {
            background: var(--warning);
            color: white;
            padding: 8px 16px;
            font-size: 13px;
        }

        .update-btn:hover {
            background: #e27807;
        }

        .delete-btn {
            background: var(--danger);
            color: white;
            padding: 8px 16px;
            font-size: 13px;
        }

        .delete-btn:hover {
            background: #dc2626;
        }

        .icon-cell {
            font-size: 24px;
            text-align: center;
            color: var(--primary);
        }

        .form-section {
            margin-top: 30px;
            padding: 25px;
            border: 2px dashed rgba(102, 126, 234, 0.3);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .form-section.show {
            display: block;
            animation: slideInUp 0.3s ease-out;
        }

        .form-section.hidden {
            display: none;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-section:hover {
            border-color: var(--primary);
            background: rgba(255, 255, 255, 1);
        }

        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark);
        }

        .close-btn {
            background: none;
            border: none;
            color: var(--gray);
            font-size: 20px;
            cursor: pointer;
            padding: 5px;
            border-radius: 50%;
            transition: all 0.3s ease;
        }

        .close-btn:hover {
            color: var(--danger);
            background: rgba(239, 68, 68, 0.1);
            transform: scale(1.1);
            box-shadow: none;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }

        .submit-btn {
            background: var(--primary);
            color: white;
            padding: 12px 24px;
        }

        .submit-btn:hover {
            background: var(--primary-hover);
        }

        .cancel-btn {
            background: var(--gray);
            color: white;
            margin-left: 12px;
        }

        .cancel-btn:hover {
            background: #94a3b8;
        }

        /* Home Button */
        .home-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 10px 16px;
            background: rgba(255, 255, 255, 0.9);
            color: var(--primary);
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.3s ease;
            border: 2px solid rgba(102, 126, 234, 0.3);
            backdrop-filter: blur(10px);
        }

        .home-btn:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .home-btn i {
            font-size: 16px;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: var(--gray);
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeIn 0.6s ease-out;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            .search-section {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                max-width: 100%;
                margin-bottom: 15px;
            }

            .action-buttons {
                flex-direction: column;
            }

            th, td {
                padding: 12px 8px;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <a href="${pageContext.request.contextPath}/manager/home" class="home-btn" title="Về trang chủ Manager">
                    <i class="fas fa-home"></i>
                    Trang chủ
                </a>
                <h1><i class="fas fa-tags"></i> Quản lý danh mục</h1>
            </div>
            <div class="role-badge">
                <i class="fas fa-user-tie"></i> Manager
            </div>
        </div>

        <!-- Search Section -->
        <div class="search-section">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Tìm kiếm danh mục..." onkeyup="searchCategories()">
                <button type="button" class="search-btn" onclick="searchCategories()">
                    <i class="fas fa-search"></i>
                    Tìm kiếm
                </button>
            </div>
            <button type="button" class="add-btn" onclick="showAddForm()">
                <i class="fas fa-plus"></i>
                Thêm danh mục
            </button>
        </div>

        <!-- Categories Table -->
        <div class="table-container">
            <table id="categoryTable">
                <thead>
                    <tr>
                        <th><i class="fas fa-hashtag"></i> ID</th>
                        <th><i class="fas fa-tag"></i> Tên danh mục</th>
                        <th><i class="fas fa-cogs"></i> Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty listcate}">
                            <tr>
                                <td colspan="3" class="empty-state">
                                    <i class="fas fa-inbox"></i>
                                    <p>Không có danh mục nào được tìm thấy</p>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listcate}" var="cate" varStatus="STT">
                                <tr>
                                    <td class="icon-cell">${STT.index+1}</td>
                                    <td><strong>${cate.categoryname}</strong></td>
                                    <td class="action-buttons">
                                        <button type="button" class="update-btn" onclick="showEditForm(${cate.id}, '${cate.categoryname}')">
                                            <i class="fas fa-edit"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="delete-btn" onclick="deleteCategory(${cate.id}, '${cate.categoryname}')">
                                            <i class="fas fa-trash"></i>
                                            Xóa
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Add/Edit Form -->
        <div id="categoryForm" class="form-section hidden">
            <div class="form-header">
                <h3 class="form-title" id="formTitle">
                    <i class="fas fa-plus-circle"></i> Thêm danh mục mới
                </h3>
                <button type="button" class="close-btn" onclick="hideForm()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            
            <form id="categoryFormElement" method="post" action="${pageContext.request.contextPath}/manager/categories">
                <input type="hidden" id="categoryId" name="id">
                <input type="hidden" id="actionInput" name="action" value="create">
                
                <div class="form-group">
                    <label for="categoryname">
                        <i class="fas fa-tag"></i> Tên danh mục:
                    </label>
                    <input type="text" id="categoryname" name="categoryname" required placeholder="Nhập tên danh mục...">
                </div>
                
                <div class="form-buttons">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-save"></i>
                        <span id="submitText">Thêm mới</span>
                    </button>
                    <button type="button" class="cancel-btn" onclick="hideForm()">
                        <i class="fas fa-times"></i>
                        Hủy bỏ
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Show add form
        function showAddForm() {
            const form = document.getElementById('categoryForm');
            form.classList.remove('hidden');
            form.classList.add('show');
            document.getElementById('formTitle').innerHTML = '<i class="fas fa-plus-circle"></i> Thêm danh mục mới';
            document.getElementById('submitText').textContent = 'Thêm mới';
            document.getElementById('actionInput').value = 'create';
            document.getElementById('categoryId').value = '';
            document.getElementById('categoryname').value = '';
            document.getElementById('categoryname').focus();
        }

        // Show edit form
        function showEditForm(id, name) {
            const form = document.getElementById('categoryForm');
            form.classList.remove('hidden');
            form.classList.add('show');
            document.getElementById('formTitle').innerHTML = '<i class="fas fa-edit"></i> Cập nhật danh mục';
            document.getElementById('submitText').textContent = 'Cập nhật';
            document.getElementById('actionInput').value = 'update';
            document.getElementById('categoryId').value = id;
            document.getElementById('categoryname').value = name;
            document.getElementById('categoryname').focus();
        }

        // Hide form
        function hideForm() {
            const form = document.getElementById('categoryForm');
            form.classList.remove('show');
            form.classList.add('hidden');
            document.getElementById('categoryFormElement').reset();
        }

        // Delete category
        function deleteCategory(id, name) {
            if (confirm(`Bạn có chắc chắn muốn xóa danh mục "${name}"?\nHành động này không thể hoàn tác!`)) {
                window.location.href = '${pageContext.request.contextPath}/manager/categories?action=delete&id=' + id;
            }
        }

        // Search categories
        function searchCategories() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('categoryTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const nameCell = rows[i].getElementsByTagName('td')[1];
                if (nameCell) {
                    const textValue = nameCell.textContent || nameCell.innerText;
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        rows[i].style.display = '';
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
            }
        }

        // Auto-hide form on escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                hideForm();
            }
        });

        // Form validation
        document.getElementById('categoryFormElement').addEventListener('submit', function(e) {
            const categoryName = document.getElementById('categoryname').value.trim();
            if (!categoryName) {
                e.preventDefault();
                alert('Vui lòng nhập tên danh mục!');
                document.getElementById('categoryname').focus();
                return false;
            }
            
            if (categoryName.length < 2) {
                e.preventDefault();
                alert('Tên danh mục phải có ít nhất 2 ký tự!');
                document.getElementById('categoryname').focus();
                return false;
            }
            
            return true;
        });

        // Auto focus search input
        document.getElementById('searchInput').addEventListener('input', searchCategories);
        
        // Search on Enter key
        document.getElementById('searchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchCategories();
            }
        });

        // Auto show edit form if category is set (for editing)
        <c:if test="${not empty category}">
            showEditForm(${category.id}, '${category.categoryname}');
        </c:if>

        // Success/Error messages
        <c:if test="${not empty message}">
            alert('${message}');
        </c:if>

        <c:if test="${not empty error}">
            alert('Lỗi: ${error}');
        </c:if>
    </script>
</body>
</html>