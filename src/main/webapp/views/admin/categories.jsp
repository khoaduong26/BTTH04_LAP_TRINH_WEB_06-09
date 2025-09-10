<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý danh mục</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #8B5FBF;
            --primary-hover: #764BA2;
            --secondary: #667eea;
            --success: #10B981;
            --danger: #EF4444;
            --warning: #F59E0B;
            --light: #F8FAFC;
            --dark: #2D3748;
            --gray: #A0AEC0;
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            --gradient: linear-gradient(135deg, #8B5FBF 0%, #667eea 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
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
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            flex: 1;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139, 95, 191, 0.3);
            outline: none;
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
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
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
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        th {
            background: var(--light);
            font-weight: 600;
            color: var(--dark);
            position: sticky;
            top: 0;
        }

        tr {
            transition: background-color 0.2s ease;
        }

        tr:hover {
            background-color: #f8fafc;
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
        }

        .form-section {
            margin-top: 30px;
            padding: 25px;
            border: 2px dashed #e2e8f0;
            border-radius: 12px;
            background: var(--light);
            transition: all 0.3s ease;
        }

        .form-section:hover {
            border-color: var(--primary);
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
        }

        .close-btn:hover {
            color: var(--danger);
            transform: none;
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
            border: 2px solid rgba(139, 95, 191, 0.3);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .home-btn:hover {
            background: var(--gradient);
            color: white;
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 8px 20px rgba(139, 95, 191, 0.3);
        }

        .home-btn i {
            font-size: 16px;
        }

        .hidden {
            display: none;
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: var(--gray);
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 16px;
            color: #e2e8f0;
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeIn 0.5s ease-out;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
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

        @media (max-width: 480px) {
            input[type="text"] {
                width: 100%;
            }
            
            button {
                width: 100%;
                justify-content: center;
            }
            
            .form-buttons {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            
            .cancel-btn {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <a href="${pageContext.request.contextPath}/admin/home" class="home-btn" title="Về trang chủ Admin">
                    <i class="fas fa-home"></i>
                    Trang chủ
                </a>
                <h1><i class="fas fa-layer-group"></i> Quản lý danh mục</h1>
            </div>
            <div class="search-section">
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Tìm kiếm danh mục...">
                    <button class="search-btn" onclick="searchCategories()">
                        <i class="fas fa-search"></i> Tìm kiếm
                    </button>
                </div>
                <button class="add-btn" onclick="showAddForm()">
                    <i class="fas fa-plus"></i> Thêm danh mục
                </button>
            </div>
        </div>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên danh mục</th>
                        <th class="icon-cell">Icon</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty listcate}">
                            <c:forEach items="${listcate}" var="category">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.categoryname}</td>
                                    <td class="icon-cell">🍟</td>
                                    <td class="action-buttons">
                                        <button class="update-btn" onclick="showEditForm(${category.id}, '${category.categoryname}')">
                                            <i class="fas fa-edit"></i> Sửa
                                        </button>
                                        <button class="delete-btn" onclick="deleteCategory(${category.id})">
                                            <i class="fas fa-trash"></i> Xóa
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4">
                                    <div class="empty-state">
                                        <i class="fas fa-inbox"></i>
                                        <h3>Không có danh mục nào</h3>
                                        <p>Hãy thêm danh mục mới để bắt đầu</p>
                                    </div>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
        
        <div id="categoryForm" class="form-section hidden">
            <div class="form-header">
                <h2 id="formTitle" class="form-title">Thêm danh mục mới</h2>
                <button class="close-btn" onclick="hideForm()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form id="categoryFormElement" action="${pageContext.request.contextPath}/admin/categories" method="post">
                <input type="hidden" id="actionType" name="action" value="create">
                <input type="hidden" id="categoryId" name="id" value="0">
                
                <div class="form-group">
                    <label for="categoryname">Tên danh mục</label>
                    <input type="text" id="categoryname" name="categoryname" required 
                           placeholder="Nhập tên danh mục">
                </div>
                
                             
                <div class="form-group">
                    <label for="icon">Icon</label>
                    <input type="text" id="icon" name="icon" value="🍟" readonly
                           style="background-color: #f1f5f9; cursor: not-allowed;">
                </div>
                
                <div class="form-buttons">
                    <button type="submit" id="submitBtn" class="submit-btn">
                        <i class="fas fa-check"></i> Xác nhận
                    </button>
                    <button type="button" onclick="hideForm()" class="cancel-btn">
                        <i class="fas fa-times"></i> Hủy bỏ
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function searchCategories() {
            const searchText = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('table tbody tr');
            let hasResults = false;
            
            rows.forEach(row => {
                if (row.querySelector('.empty-state')) return;
                
                const name = row.cells[1].textContent.toLowerCase();
                if (name.includes(searchText)) {
                    row.style.display = '';
                    hasResults = true;
                } else {
                    row.style.display = 'none';
                }
            });
        }
        
        function showAddForm() {
            document.getElementById('formTitle').textContent = 'Thêm danh mục mới';
            document.getElementById('actionType').value = 'create';
            document.getElementById('categoryId').value = '0';
            document.getElementById('categoryname').value = '';
            document.getElementById('categoryForm').classList.remove('hidden');
            document.getElementById('categoryname').focus();
        }
        
        function showEditForm(id, name) {
            document.getElementById('formTitle').textContent = 'Chỉnh sửa danh mục';
            document.getElementById('actionType').value = 'update';
            document.getElementById('categoryId').value = id;
            document.getElementById('categoryname').value = name;
            document.getElementById('categoryForm').classList.remove('hidden');
            document.getElementById('categoryname').focus();
        }
        
        function hideForm() {
            document.getElementById('categoryForm').classList.add('hidden');
        }
        
        function deleteCategory(id) {
            if (confirm('Bạn có chắc chắn muốn xóa danh mục này? Thao tác này không thể hoàn tác.')) {
                window.location.href = '${pageContext.request.contextPath}/admin/categories?action=delete&id=' + id;
            }
        }
        
        // Hiển thị form chỉnh sửa nếu có category trong request (khi chuyển từ edit)
        <c:if test="${not empty category}">
            showEditForm(${category.id}, '${category.categoryname}');
        </c:if>
        
        // Tìm kiếm khi nhấn Enter
        document.getElementById('searchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchCategories();
            }
        });
    </script>
</body>
</html>