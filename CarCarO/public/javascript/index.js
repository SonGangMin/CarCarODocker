    // $(function(){
    //     $('.bxslider').bxSlider({
    //     mode: 'horizontal',
    //     captions: true,
    //     // slideWidth: 600
    //     });
    // });
    $('.slider').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 2000,
    });

const loadMoreBtn = document.getElementById('loadMoreBtn');
const reccarList = document.querySelector('.reccarList ul');
const twitsul = document.querySelectorAll('.reccarList ul li');

let itemPerPage = 8;
let currentItem = itemPerPage;

loadMoreBtn.addEventListener('click', function() {
  for(let i=currentItem; i<currentItem+itemPerPage; i++) {
    if(twitsul[i]) {
        twitsul[i].style.display = 'block';
    } else {
      loadMoreBtn.style.display = 'none';
      break;
    }
  }
  currentItem += itemPerPage;
});

// 초기 로드 시 8개까지만 보이도록 설정
for(let i=itemPerPage; i<twitsul.length; i++) {
    twitsul[i].style.display = 'none';
}

