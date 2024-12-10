class DataSectorsEn {
  static const String banks = 'banks';
  static const String basic = 'Basic resources';
  static const String health = 'Health care and medicines';
  static const String industrial = 'Industrial services, products and cars';
  static const String real = 'Real estate';
  static const String tourism = 'Tourism and entertainment';
  static const String communications =
      'Communications, media and information technology';
  static const String food = 'Food, drinks and tobacco';
  static const String energy = 'Energy and support services';
  static const String traders = 'Traders and distributors';
  static const String transportation = 'Transportation and shipping services';
  static const String educational = 'Educational services';
  static const String nonBanking = 'Non-banking financial services';
  static const String engineering = 'Engineering contracting and construction';
  static const String textiles = 'Textiles and durable goods';
  static const String building = 'Building materials';
  static const String paper = 'Paper and packaging materials';

  static const String banks1 = 'banks';
  static const String basic1 = 'Basic resources';
  static const String health1 = 'Health care and medicines';
  static const String industrial1 = 'Industrial services, products and cars';
  static const String real1 = 'Real estate';
  static const String tourism1 = 'Tourism and entertainment';
  static const String communications1 =
      'Communications, media and information technology';
  static const String food1 = 'Food, drinks and tobacco';
  static const String energy1 = 'Energy and support services';
  static const String traders1 = 'Traders and distributors';
  static const String transportation1 = 'Transportation and shipping services';
  static const String educational1 = 'educational services';
  static const String nonBanking1 = 'Non-banking financial services';
  static const String engineering1 = 'Engineering contracting and construction';
  static const String textiles1 = 'Textiles and durable goods';
  static const String building1 = 'Building materials';
  static const String paper1 = 'Paper and packaging materials';

  final String name;
  final String image;
  final String description;
  final String profit;
  final bool isBlue;
  DataSectorsEn({
    required this.name,
    required this.image,
    required this.description,
    required this.profit,
    required this.isBlue,
  });

  static List<DataSectorsEn> getSectors({required String name}) {
    if (name == banks) {
      return [
        DataSectorsEn(
          name: "ADIB",
          image: 'assets/images/bank1.png', //assets/images/bank1.png
          description: 'Abu Dhabi Islamic Bank - Egypt',
          profit: "2.92%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "CIB",
          image: 'assets/images/bank2.png',
          description: 'Commercial International Bank-Egypt',
          profit: "-0.26%",
          isBlue: false,
        ),
      ];
    } else if (name == industrial) {
      return [
        DataSectorsEn(
          name: "SWDY",
          image: 'assets/images/industrial1.png',
          description: 'El Sewedy Electric',
          profit: "-0.91%",
          isBlue: false,
        ),
        DataSectorsEn(
          name: "AUTO",
          image: 'assets/images/industrial2.png',
          description: 'GB corp',
          profit: "8.77%",
          isBlue: true,
        ),
      ];
    } else if (name == real) {
      return [
        DataSectorsEn(
          name: "HELI",
          image: 'assets/images/real1.png',
          description: 'Heliopolis house',
          profit: "-11.04%",
          isBlue: false,
        ),
        DataSectorsEn(
          name: "MNHD",
          image: 'assets/images/real2.png',
          description: 'Madnet Masr for housingand development',
          profit: "2.32%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "ORHD",
          image: 'assets/images/real3.png',
          description: 'Orascom Development Egypt',
          profit: "1.29%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "PHDC",
          image: 'assets/images/real4.png',
          description: 'Palm Hills Development Company',
          profit: "4.30%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "TMGH",
          image: 'assets/images/real5.png',
          description: 'Talaat Moustafa Group Holding',
          profit: " 4.30%",
          isBlue: true,
        ),
      ];
    } else if (name == communications) {
      return [
        DataSectorsEn(
          name: "FWRY",
          image: 'assets/images/communications1.png',
          description: 'Fawry for Banking Technology and  Electronic Payments',
          profit: "0.54%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "ETEL",
          image: 'assets/images/communications2.png',
          description: 'Telecom Egypt ',
          profit: "1.34%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "EFIH",
          image: 'assets/images/communications3.png',
          description: 'E-finance For Digital\nand Financial Institutions',
          profit: "2.47%",
          isBlue: true,
        ),
      ];
    } else if (name == food) {
      return [
        DataSectorsEn(
          name: " AMOC",
          image: 'assets/images/food1.png',
          description: 'Alexandria Mineral Oils Company',
          profit: "6.56%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "SUGR",
          image: 'assets/images/food2.png',
          description: 'Delta Sugar',
          profit: " 0.38%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "EFID",
          image: 'assets/images/food3.png',
          description: 'Edita Food Industries',
          profit: "3.92%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "JUFO",
          image: 'assets/images/food4.png',
          description: 'Juhayna Food Industries',
          profit: "4.19%",
          isBlue: true,
        ),
      ];
    } else if (name == transportation) {
      return [
        DataSectorsEn(
          name: " ALCN",
          image: 'assets/images/transportation1.png',
          description: 'Alexandria Containers and Goods',
          profit: "-0.59%",
          isBlue: false,
        ),
      ];
    } else if (name == nonBanking) {
      return [
        DataSectorsEn(
          name: "BTFH",
          image: 'assets/images/nonbanking1.png',
          description: 'Beltone Holding',
          profit: "3.37%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "HRHO",
          image: 'assets/images/nonbanking2.png',
          description: 'EFG Hermes Holding',
          profit: "4.19%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: "EKHO",
          image: 'assets/images/nonbanking3.png',
          description: 'Egyptian Kuwaiti Holding',
          profit: "-0.47%",
          isBlue: false,
        ),
        DataSectorsEn(
          name: "EKHOA",
          image: 'assets/images/nonbanking4.png',
          description: 'Egyptian Kuwaiti Holding-EGP',
          profit: "0.26%",
          isBlue: true,
        ),
      ];
    } else if (name == engineering) {
      return [
        DataSectorsEn(
          name: "ORAS",
          image: 'assets/images/engineering.png',
          description: 'Orascom Construction PLC',
          profit: "1.34%",
          isBlue: true,
        ),
      ];
    } else if (name == textiles) {
      return [
        DataSectorsEn(
          name: "ORWE",
          image: 'assets/images/textiles.png',
          description: 'Oriental Weavers',
          profit: "2.24%",
          isBlue: true,
        ),
      ];
    } else if (name == health) {
      return [
        DataSectorsEn(
          name: "PHAR",
          image: 'assets/images/health1.png',
          description: 'Egyptian International Pharmaceuticals (EIPICO)',
          profit: "-.71%",
          isBlue: false,
        ),
        DataSectorsEn(
          name: "ISPH",
          image: 'assets/images/health2.png',
          description: 'Egyptian International Pharmaceuticals (EIPICO)',
          profit: "0.00%",
          isBlue: true,
        ),
      ];
    } else if (name == basic) {
      return [
        DataSectorsEn(
          name: "ESRS",
          image: 'assets/images/basic1.png',
          description: 'Ezz Steel',
          profit: "1.78%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: " MFPC",
          image: 'assets/images/basic2.png',
          description: 'Misr Fertilizers Production Company(Mopco)',
          profit: "0.72%",
          isBlue: true,
        ),
        DataSectorsEn(
          name: " SKPC",
          image: 'assets/images/basic3.png',
          description: ' Sidi Kerir Petrochemicals - SIDPEC',
          profit: "0.26%",
          isBlue: true,
        ),
      ];
    } else {
      return [];
    }
  }
}

class DataSectorsAr {
  static const String banks = 'banks';
  static const String basic = 'Basic resources';
  static const String health = 'Health care and medicines';
  static const String industrial = 'Industrial services, products and cars';
  static const String real = 'real estate';
  static const String tourism = 'Tourism and entertainment';
  static const String communications =
      'Communications, media and information technology';
  static const String food = 'Food, drinks and tobacco';
  static const String energy = 'Energy and support services';
  static const String traders = 'Traders and distributors';
  static const String transportation = 'Transportation and shipping services';
  static const String educational = 'educational services';
  static const String nonBanking = 'Non-banking financial services';
  static const String engineering = 'Engineering contracting and construction';
  static const String textiles = 'Textiles and durable goods';
  static const String building = 'Building materials';
  static const String paper = 'Paper and packaging materials';

  static const String banks1 = 'بنوك';
  static const String basic1 = "موارد اساسيه";
  static const String health1 = "رعاية صحيه وادويه";
  static const String industrial1 = "خدمات ومنتجات صناعيه وسيارات";
  static const String real1 = "عقارات";
  static const String tourism1 = "سياحه وترفيه";
  static const String communications1 = "اتصالات واعلام وتكنولوجيا المعلومات";
  static const String food1 = "اغذيه ومشروبات وتبغ";
  static const String energy1 = "طاقه وخدمات مسانده ";
  static const String traders1 = "تجاره وموزعون";
  static const String transportation1 = "خدمات النقل والشحن";
  static const String educational1 = "خدمات تعليميه";
  static const String nonBanking1 = "خدمات ماليه غير مصرفيه";
  static const String engineering1 = "مقاولات وإنشاءات هندسيه";
  static const String textiles1 = "منسوجات وسلع معمره";
  static const String building1 = "مواد البناء";
  static const String paper1 = "ورق ومواد تعبئه وتغليف";

  final String name;
  final String image;
  final String description;
  final String profit;
  final bool isBlue;
  DataSectorsAr({
    required this.name,
    required this.image,
    required this.description,
    required this.profit,
    required this.isBlue,
  });

  static List<DataSectorsAr> getSectors({required String name}) {
    if (name == banks) {
      return [
        DataSectorsAr(
          name: "ADIB",
          image: 'assets/images/bank1.png', //assets/images/bank1.png
          description: "مصرف أبوظبي الإسلامي - مصر",
          profit: "2.92%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "CIB",
          image: 'assets/images/bank2.png',
          description: "البنك التجاري الدولي- مصر",
          profit: "-0.26%",
          isBlue: false,
        ),
      ];
    } else if (name == industrial) {
      return [
        DataSectorsAr(
          name: "SWDY",
          image: 'assets/images/industrial1.png',
          description: "السويدي الكتريك",
          profit: "-0.91%",
          isBlue: false,
        ),
        DataSectorsAr(
          name: "AUTO",
          image: 'assets/images/industrial2.png',
          description: "جي بي كورب",
          profit: "8.77%",
          isBlue: true,
        ),
      ];
    } else if (name == real) {
      return [
        DataSectorsAr(
          name: "HELI",
          image: 'assets/images/real1.png',
          description: "مصر الجديده للاسكان والتعمير ",
          profit: "-11.04%",
          isBlue: false,
        ),
        DataSectorsAr(
          name: "MNHD",
          image: 'assets/images/real2.png',
          description: "مدينة نصر للاسكان والتعمير ",
          profit: "2.32%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "ORHD",
          image: 'assets/images/real3.png',
          description: "اوراسكوم للتنمية مصر",
          profit: "1.29%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "PHDC",
          image: 'assets/images/real4.png',
          description: "بالم هيلز للتعمير",
          profit: "4.30%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "TMGH",
          image: 'assets/images/real5.png',
          description: "مجموعة طلعت مصطفى القابضة ",
          profit: " 4.30%",
          isBlue: true,
        ),
      ];
    } else if (name == communications) {
      return [
        DataSectorsAr(
          name: "FWRY",
          image: 'assets/images/communications1.png',
          description: " فوري لتكنولوجيا البنوك والمدفوعات الالكترونيه ",
          profit: "0.54%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "ETEL",
          image: 'assets/images/communications2.png',
          description: "المصرية للاتصالات",
          profit: "1.34%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "EFIH",
          image: 'assets/images/communications3.png',
          description: "اي - فاينانس للاستثمارات المالية والرقمية",
          profit: "2.47%",
          isBlue: true,
        ),
      ];
    } else if (name == food) {
      return [
        DataSectorsAr(
          name: " AMOC",
          image: 'assets/images/food1.png',
          description: "الاسكندريه للزيوت المعدنيه",
          profit: "6.56%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "SUGR",
          image: 'assets/images/food2.png',
          description: "الدلتا للسكر",
          profit: " 0.38%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "EFID",
          image: 'assets/images/food3.png',
          description: "أيديتا للصناعات الغذائيه",
          profit: "3.92%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "JUFO",
          image: 'assets/images/food4.png',
          description: "جهينه للصناعات الغذائيه",
          profit: "4.19%",
          isBlue: true,
        ),
      ];
    } else if (name == transportation) {
      return [
        DataSectorsAr(
          name: " ALCN",
          image: 'assets/images/transportation1.png',
          description: "الاسكندريه لتداول الحاويات والبضائع",
          profit: "-0.59%",
          isBlue: false,
        ),
      ];
    } else if (name == nonBanking) {
      return [
        DataSectorsAr(
          name: "BTFH",
          image: 'assets/images/nonbanking1.png',
          description: "بلتون الماليه القابضه",
          profit: "3.37%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "HRHO",
          image: 'assets/images/nonbanking2.png',
          description: "مجموعه اي اف جي القابضه",
          profit: "4.19%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: "EKHO",
          image: 'assets/images/nonbanking3.png',
          description: "القابضه المصرية الكويتية - دولار امريكي ",
          profit: "-0.47%",
          isBlue: false,
        ),
        DataSectorsAr(
          name: "EKHOA",
          image: 'assets/images/nonbanking4.png',
          description: "القابضه المصرية الكويتية - جنيه مصري",
          profit: "0.26%",
          isBlue: true,
        ),
      ];
    } else if (name == engineering) {
      return [
        DataSectorsAr(
          name: "ORAS",
          image: 'assets/images/engineering.png',
          description: "اوراسكوم كونستراكشون بي ال سي",
          profit: "1.34%",
          isBlue: true,
        ),
      ];
    } else if (name == textiles) {
      return [
        DataSectorsAr(
          name: "ORWE",
          image: 'assets/images/textiles.png',
          description: "النساجون الشرقيون للسجاد",
          profit: "2.24%",
          isBlue: true,
        ),
      ];
    } else if (name == health) {
      return [
        DataSectorsAr(
          name: "PHAR",
          image: 'assets/images/health1.png',
          description: "المصرية الدوليه للصناعات الدوائيه - ايبكيو",
          profit: "-.71%",
          isBlue: false,
        ),
        DataSectorsAr(
          name: "ISPH",
          image: 'assets/images/health2.png',
          description: "ابن سينا فارما",
          profit: "0.00%",
          isBlue: true,
        ),
      ];
    } else if (name == basic) {
      return [
        DataSectorsAr(
          name: "ESRS",
          image: 'assets/images/basic1.png',
          description: "حديد عز",
          profit: "1.78%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: " MFPC",
          image: 'assets/images/basic2.png',
          description: "مصر لإنتاج الأسمدة - موبكو",
          profit: "0.72%",
          isBlue: true,
        ),
        DataSectorsAr(
          name: " SKPC",
          image: 'assets/images/basic3.png',
          description: "سيدي كرير للبتروكيماويات",
          profit: "0.26%",
          isBlue: true,
        ),
      ];
    } else {
      return [];
    }
  }
}
