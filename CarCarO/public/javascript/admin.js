// // 탭 컨텐츠 요소
// const tabContents = document.querySelectorAll(".tab__content");

// // 탭 메뉴 요소
// const tabMenus = document.querySelectorAll(".tab__menu > li");

// // 탭 메뉴 클릭 시 이벤트 처리 함수
// function handleTabMenuClick(e) {
//   // 클릭한 탭 메뉴 요소와 해당하는 탭 컨텐츠 요소 가져오기
//   const targetMenu = e.target.closest("li");
//   const targetContent = document.querySelector(
//     `#${targetMenu.dataset.tabContent}`
//   );

//   // 모든 탭 메뉴와 탭 컨텐츠 요소에 active 클래스 제거
//   tabMenus.forEach((menu) => menu.classList.remove("active"));
//   tabContents.forEach((content) => content.classList.remove("active"));

//   // 클릭한 탭 메뉴와 해당하는 탭 컨텐츠 요소에 active 클래스 추가
//   targetMenu.classList.add("active");
//   targetContent.classList.add("active");
// }

// // 탭 메뉴에 클릭 이벤트 등록
// tabMenus.forEach((menu) => menu.addEventListener("click", handleTabMenuClick));
