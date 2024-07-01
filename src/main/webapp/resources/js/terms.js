document.addEventListener('DOMContentLoaded', function() {
    let form = document.getElementById('termsForm');
    let checkboxes = form.querySelectorAll('input[type="checkbox"]');
    let termsBtn = document.getElementById('termsBtn');
    let allAgreeCheckbox = document.getElementById('allAgree');

    // 필수 체크박스만 선택
    let requiredCheckboxes = Array.from(checkboxes).filter(checkbox => checkbox.hasAttribute('required'));

    function checkAgreement() {
        // 필수 체크박스가 모두 체크되었는지 확인
        let allRequiredChecked = requiredCheckboxes.every(checkbox => checkbox.checked);
        termsBtn.disabled = !allRequiredChecked;
    }

    function updateAllAgreeCheckbox() {
        // 모든 체크박스가 체크되었는지 확인하여 전체동의 체크박스 업데이트
        let allChecked = Array.from(checkboxes).filter(checkbox => checkbox.id !== 'allAgree').every(checkbox => checkbox.checked);
        allAgreeCheckbox.checked = allChecked;
    }

    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            if (checkbox === allAgreeCheckbox) {
                let state = checkbox.checked;
                checkboxes.forEach(cb => {
                    if (cb !== allAgreeCheckbox) {
                        cb.checked = state;
                    }
                });
            } else {
                updateAllAgreeCheckbox();
            }
            checkAgreement();
        });
    });

    checkAgreement();
});
