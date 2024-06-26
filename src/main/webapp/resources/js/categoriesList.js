document.addEventListener('DOMContentLoaded', function() {
    var categoriesList = document.getElementById('categories-list');
    var additionalCategories = document.getElementById('additional-categories');
    var categoriesAll = document.querySelector('.hero__categories__all');

    // 초기 설정: 추가 카테고리는 숨기고 기본 카테고리는 보이기
    additionalCategories.style.display = 'none'; // 추가 카테고리는 초기에 닫힌 상태로 설정

    // '카테고리' 버튼 클릭 시
    categoriesAll.addEventListener('click', function() {
        if (additionalCategories.style.display === 'none') {
            additionalCategories.style.display = 'block';
            categoriesList.style.display = 'none';
        } else {
            additionalCategories.style.display = 'none';
            categoriesList.style.display = 'block';
        }
    });

    // '재료 사러가기' 링크 클릭 시
    document.getElementById('ingredient-link').addEventListener('click', function(event) {
        event.preventDefault();
        toggleCategoriesVisibility();
    });

    // '레시피 보기' 링크 클릭 시
    document.getElementById('view-recipes').addEventListener('click', function(event) {
        event.preventDefault();
        toggleCategoriesVisibility();
    });

    function toggleCategoriesVisibility() {
        if (additionalCategories.style.display === 'none') {
            additionalCategories.style.display = 'block';
            categoriesList.style.display = 'none';
        } else {
            additionalCategories.style.display = 'none';
            categoriesList.style.display = 'block';
        }
    }
});
