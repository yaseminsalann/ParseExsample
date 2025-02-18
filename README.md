# ParseExsample
Parse Veritabanı, Facebook’un 2013 yılında satın aldığı ve 2016 yılında açık kaynak olarak yayınladığı Parse Platformunun bir parçasıdır. Parse, mobil ve web uygulamaları için Backend-as-a-Service (BaaS) olarak hizmet veren bir platformdu. Ancak Facebook, Parse’i kapatma kararı aldıktan sonra topluluk tarafından geliştirilerek açık kaynak bir proje haline geldi.
Parse Veritabanı Nedir?
Parse veritabanı, NoSQL tabanlı bir veri depolama sistemidir ve genellikle MongoDB kullanır. Parse Server, bu veritabanı ile uygulamalar için hazır bir backend sağlar.

Parse'in Özellikleri
Kolay Kurulum:
Parse Server, Node.js ve MongoDB kullanarak çalışır.
Uygulamalar için hızlı backend oluşturmayı sağlar.

NoSQL Yapısı:
JSON formatında veri saklar.
Geleneksel SQL yerine esnek veri modeli sunar.

Otomatik API Desteği:
Parse, veritabanındaki verileri otomatik olarak REST API üzerinden erişilebilir hale getirir.

Gerçek Zamanlı Veri Senkronizasyonu:
Live Queries özelliği ile anlık veri güncellemeleri sağlar.

Kimlik Doğrulama:
Kullanıcı giriş ve kayıt işlemleri için hazır mekanizmalar sunar.
Parse Veritabanı Kullanım Alanları
Mobil uygulama geliştirme (iOS, Android)
Web uygulamaları
Oyun backend sistemleri
IoT uygulamaları

Eğer kendi Parse Server’ınızı kurmak isterseniz, Node.js ve MongoDB kullanarak aşağıdaki gibi bir kurulum yapabilirsiniz.
Ardından, kendi veritabanınızı bağlayarak çalıştırabilirsiniz. Parse, açık kaynak olduğu için kendi sunucunuza kurup özelleştirebilirsiniz.


Proje içinde Singleton yapısıda kullanılmışdır.
Singleton, yazılım geliştirmede tasarım desenlerinden (design pattern) biridir ve amacı bir sınıftan sadece bir tane nesne oluşturulmasını sağlamak ve bu nesneye global erişim sunmaktır.

Singleton'ın Temel Özellikleri:

Tek bir örnek (instance) bulunur.
Uygulama boyunca bir sınıfın yalnızca tek bir nesnesi oluşturulur ve bu nesne tekrar tekrar kullanılabilir.
Global erişim noktası sağlar.
Singleton nesnesine her yerden erişilebilir.
Bellek kullanımını optimize eder.
Aynı nesneyi tekrar oluşturmak yerine, mevcut nesneyi kullanarak gereksiz nesne oluşturmayı önler.

Singleton'ın Dezavantajları
❌ Global erişim kontrolsüz olabilir.

Her yerden erişilebilir olması, yanlış kullanım riskini artırabilir.
❌ Unit Testleri zorlaştırabilir.

Singleton, bağımlılıkları (dependency) doğrudan bağladığı için testlerde mocking (sahte nesne oluşturma) işlemlerini zorlaştırabilir.
❌ Çoklu iş parçacığında (multithreading) dikkatli olunmalıdır.

Tek bir örnek olduğu için, birden fazla iş parçacığı aynı anda Singleton'ı kullanıyorsa, senkronizasyon (thread-safety) gerektirebilir.

Sonuç
Singleton, uygulama genelinde tek bir nesne oluşturmak için kullanılır.
Bellek optimizasyonu ve global erişim sağlar.
Önemli senaryolar: Kullanıcı yönetimi, veri saklama, ağ istekleri, loglama, cache yönetimi.
Dikkatli kullanılmalıdır çünkü unit testleri zorlaştırabilir ve thread güvenliği gerektirebilir.
💡 Küçük projelerde fazla kullanılmamalıdır, ancak büyük projelerde doğru şekilde kullanıldığında performansı artırabilir.
 
