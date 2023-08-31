function regist() {
    const title = document.querySelector('.title').value;
    const content = document.querySelector('.content').value;
    const user_id = document.querySelector('.user_id').value;

    if (title === "" || content === "" || user_id === "") {
    alert("항목을 모두 입력해주세요.");
    return false;
    } else {
    alert("등록이 완료되었습니다.");
    return true;
    }
}