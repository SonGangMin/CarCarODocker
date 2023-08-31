const img = document.getElementById("input-multi-files");
const preview = document.getElementById("preview");
const from = document.getElementById("from");
const fromSelect = document.getElementById("from");
const brandSelect = document.getElementById("brand");


// 수정페이지 select에 value 값나오게하기
fromSelect.addEventListener("change", () => {
  brandSelect.innerHTML = "";
  if (fromSelect.value === "국산") {
    brandSelect.innerHTML = `
        <option value="현대">현대</option>
        <option value="제네시스">제네시스</option>
        <option value="기아">기아</option>
        <option value="쉐보레">쉐보레(GM대우)</option>
        <option value="쌍용">쌍용</option>
        <option value="국산기타">기타</option>
        
    `;
  } else if (fromSelect.value === "수입") {
    brandSelect.innerHTML = `
    <option value="벤츠">벤츠</option>
    <option value="아우디">아우디</option>
    <option value="BMW">BMW</option>
    <option value="볼보">볼보</option>
    <option value="폭스바겐">폭스바겐</option>
    <option value="포르쉐">포르쉐</option>
    <option value="수입기타">기타</option>
    `;
  } else {
    brandSelect.innerHTML = `
      <option value="" selected>국산·수입 선택하세요</option>
    `;
  }
});

// 슬라이드 미리보기이미지
img.addEventListener("change", () => {
  if (img.value) {
    preview.style.display = "flex";
  }
});

// 해시태그 갯수제한
const hashtag = document.getElementById("hashtag");
hashtag.addEventListener('input', (e) => {
  const value = e.target.value;
  const hashCount = (value.match(/#/g) || []).length;
  if (hashCount > 4) {
    e.target.value = value.slice(0, -1);
  }
})

