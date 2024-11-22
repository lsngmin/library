// let loginAttempts = 0;
// const MAX_ATTEMPTS = 5; // 로그인 최대 시도 횟수
// const LOCKOUT_TIME = 60000; // 잠금 시간 (밀리초) - 예: 1분
//
// document.addEventListener('DOMContentLoaded', function() {
//     var loginButton = document.getElementById('loginBtn');
//     alert(loginButton)
//     if (loginButton) {
//         loginButton.addEventListener('click', function(event) {
//             // 로그인 시도 횟수가 제한을 넘은 경우 버튼 비활성화
//             if (loginAttempts >= MAX_ATTEMPTS) {
//                 alert('로그인 시도 횟수가 초과되었습니다. 잠시 후 다시 시도해주세요.');
//                 event.preventDefault();
//                 return;
//             }
//
//             // 로그인 버튼이 클릭될 때마다 시도 횟수 증가
//             loginAttempts++;
//             console.log(`로그인 시도 횟수: ${loginAttempts}`);
//
//             // 로그인 시도 횟수가 최대에 도달한 경우 버튼 비활성화 및 일정 시간 후 다시 활성화
//             if (loginAttempts >= MAX_ATTEMPTS) {
//                 loginButton.disabled = true;
//                 setTimeout(function() {
//                     loginAttempts = 0; // 시도 횟수 초기화
//                     loginButton.disabled = false; // 버튼 다시 활성화
//                     alert('로그인 버튼이 다시 활성화되었습니다. 이제 다시 시도할 수 있습니다.');
//                 }, LOCKOUT_TIME);
//             }
//         });
//     }
// });