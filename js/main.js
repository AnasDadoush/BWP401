// تحميل الخط العربي
document.addEventListener('DOMContentLoaded', function() {
    // إضافة تأثيرات التحميل للصور
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.addEventListener('load', function() {
            this.classList.add('loaded');
        });
    });

    // تأثيرات التمرير السلس
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // تحقق من نموذج الاتصال
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // التحقق من صحة البيانات
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const message = document.getElementById('message').value;
            
            if (!name || !email || !message) {
                alert('الرجاء ملء جميع الحقول المطلوبة');
                return;
            }
            
            // هنا يمكن إضافة كود لإرسال البيانات إلى الخادم
            alert('تم إرسال رسالتك بنجاح!');
            contactForm.reset();
        });
    }
});
