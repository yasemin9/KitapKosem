# 📚 KitapKöşem: Online Kitap İnceleme ve Puanlama Sistemi

## 🔍 Proje Hakkında

**KitapKöşem**, kullanıcıların kitaplar hakkında bilgi edinmesini, yorum yapmasını ve puanlamasını sağlayan web tabanlı bir kitap değerlendirme platformudur. Bu proje, Java Web teknolojileri kullanılarak geliştirilmiş, kullanıcı deneyimi ve MVC mimarisine uygun bir yapı hedeflenmiştir.

---

## 🎯 Projenin Amacı

Bu projenin amacı;

- **HTML, CSS ve Bootstrap** kullanarak kullanıcı dostu ve responsive web arayüzü geliştirmek,
- **Java Servlet ve JSP** ile sunucu taraflı dinamik içerik yönetimi yapmak,
- **JDBC kullanarak MySQL veritabanı ile etkileşim kurmak**,
- **Katmanlı mimari (MVC)** ile yazılım geliştirme prensiplerini uygulamaktır.

Proje sonunda öğrencilerin Java web programlamasına hakimiyet kazanması ve veritabanı yönetimi ile arayüz entegrasyonunu öğrenmesi hedeflenmiştir.

---

## 🧪 Kullanım Talimatları

### 1. Veritabanı Kurulumu
- `sql/kitapkosem.sql` dosyasını MySQL veritabanınıza import edin:
  ```sql
  SOURCE path/to/kitapkosem.sql;,

### 2. Projeyi Çalıştırma

- Projeyi bir Maven projesi olarak Eclipse veya IntelliJ IDE sine import edin.
- Apache Tomcat 9 sunucusunu kurun ve projeye entegre edin.
- `pom.xml` dosyası otomatik bağımlılıkları yönetecektir.
- Uygulamayı çalıştırdıktan sonra tarayıcınızda şu adresi ziyaret edin:  
  👉 [http://localhost:8080/KitapKosem](http://localhost:8080/KitapKosem)

---

### 3. Giriş Bilgisi (Varsayılan Demo Hesap)

- **E-posta:** `demo@kitap.com`  
- **Şifre:** `12345`

---

## 🧩 Proje Özellikleri

- 🔓 **Giriş Yapmadan Kitapları Görüntüleme**  
  Kullanıcılar giriş yapmadan kitap listesine ulaşabilir ve açıklamalarını okuyabilir.

- 🔑 **Kayıt Olma ve Giriş Yapma**  
  Kullanıcılar kayıt olarak sisteme giriş yapabilir, kişisel işlemlerini gerçekleştirebilir.

- 📚 **Kitap Ekleme**  
  Giriş yapan kullanıcılar kitap başlığı, yazar adı ve açıklamasıyla yeni kitap ekleyebilir.

- 💬 **Yorum Yapma ve Puan Verme**  
  Kullanıcılar kitaplara yorum yazabilir ve 1–5 arası puan verebilir.

- 🔍 **Arama Özelliği**  
  Arama çubuğu sayesinde kitaplara isimlerine göre filtreleme uygulanabilir.

- ⭐ **Ortalama Puan Görüntüleme**  
  Her kitap için verilen tüm puanların ortalaması hesaplanarak detay sayfasında gösterilir.

---

---

## 🛠️ Kullanılan Teknolojiler

- Java Servlet & JSP
- JDBC (MySQL)
- HTML5, CSS3, Bootstrap
- Apache Tomcat 9
- Maven

---

## 👤 Geliştirici

**Yasemin Delican**  
Ondokuz Mayıs Üniversitesi, Bilgisayar Mühendisliği  
📧 yasemindelican9@gmail.com  
🔗 [linkedin.com/in/yasemin-delican](https://linkedin.com/in/yasemin-delican)

---

