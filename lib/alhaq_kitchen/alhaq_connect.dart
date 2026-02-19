import 'package:flutter/material.dart';

void main() {
  runApp(const AlHaqConnectApp());
}

// ==============================
// 1. CONSTANTS & THEME
// ==============================
class AppColors {
  static const Color backgroundDark = Color(0xFF1C1608);
  static const Color backgroundLight = Color(0xFF3E2F12);
  static const Color primaryGold = Color(0xFFC6A664);
  static const Color cardSurface = Color(0x1AFFFFFF); 
  static const Color textLight = Color(0xFFEEEEEE);
}

TextStyle luxuryTextStyle({double size = 16, FontWeight weight = FontWeight.w600}) {
  return TextStyle(
    color: AppColors.primaryGold,
    fontSize: size,
    fontWeight: weight,
  );
}

TextStyle bodyTextStyle({double size = 14, Color color = AppColors.textLight}) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
}

// ==============================
// 2. MAIN APP & ROUTES
// ==============================
class AlHaqConnectApp extends StatelessWidget {
  const AlHaqConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Haq Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundDark,
        primaryColor: AppColors.primaryGold,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: AppColors.textLight,
          displayColor: AppColors.textLight,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/latest_order': (context) => const LatestOrderScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/menu_detail': (context) => const MenuDetailScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}

// ==============================
// 3. REUSABLE WIDGETS
// ==============================
class LuxuryScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  const LuxuryScaffold({super.key, required this.body, this.appBar, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.backgroundDark, AppColors.backgroundLight],
          ),
        ),
        child: SafeArea(child: body),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class LuxuryCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const LuxuryCard({super.key, required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          borderRadius: BorderRadius.circular(16),
          // ignore: deprecated_member_use
          border: Border.all(color: AppColors.primaryGold.withOpacity(0.3), width: 1),
        ),
        child: child,
      ),
    );
  }
}

// ==============================
// 4. SCREENS (1-7)
// ==============================

// --- SCREEN 1: SPLASH ---
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }); 
    return LuxuryScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant_menu, size: 80, color: AppColors.primaryGold),
            const SizedBox(height: 20),
            Text('Al-Haq\nConnect', textAlign: TextAlign.center, style: luxuryTextStyle(size: 36, weight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 2: HOME ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primaryGold),
        title: Text('Al-Haq Kitchen', style: luxuryTextStyle(size: 20)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: AppColors.primaryGold),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    child: LuxuryCard(
                      onTap: () => Navigator.pushNamed(context, '/menu_detail'),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Gourmet Tumpeng $index', style: luxuryTextStyle(size: 14)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            LuxuryCard(
              onTap: () => Navigator.pushNamed(context, '/latest_order'),
              child: Row(
                children: [
                  const Icon(Icons.receipt_long, color: AppColors.primaryGold),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Latest Order', style: luxuryTextStyle(size: 16)),
                      Text('Check status pesananmu', style: bodyTextStyle(size: 12)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, color: AppColors.primaryGold, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundDark,
        selectedItemColor: AppColors.primaryGold,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- SCREEN 3: LATEST ORDER ---
class LatestOrderScreen extends StatelessWidget {
  const LatestOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGold), onPressed: () => Navigator.pop(context)),
        title: Text('Latest Order', style: luxuryTextStyle(size: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LuxuryCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.card_giftcard, color: AppColors.primaryGold, size: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order #AHC-8821', style: luxuryTextStyle(size: 18)),
                      Text('May 25, 2022', style: bodyTextStyle(color: AppColors.primaryGold)),
                    ],
                  ),
                  const CircleAvatar(backgroundColor: AppColors.primaryGold, radius: 15, child: Icon(Icons.check, size: 15, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- SCREEN 4: PROFILE ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(icon: const Icon(Icons.close, color: AppColors.primaryGold), onPressed: () => Navigator.pop(context))),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(width: 100, height: 100, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primaryGold, width: 2)), child: const Icon(Icons.person, size: 50)),
            const SizedBox(height: 15),
            Text('Fin si Owner E30', style: luxuryTextStyle(size: 22)),
            const Spacer(),
            Text('"Gaperlu pusing coding, mending beli Al-Haq catering."', style: luxuryTextStyle(size: 14)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 5: MENU DETAIL ---
class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({super.key});
  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  int quantity = 1;
  String selectedSpicy = 'Medium';

  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      body: Stack(
        children: [
          Container(height: MediaQuery.of(context).size.height * 0.4, color: Colors.black, child: const Center(child: Icon(Icons.restaurant, size: 100, color: AppColors.primaryGold))),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Text('Premium Nasi Tumpeng Mini', style: luxuryTextStyle(size: 28, weight: FontWeight.bold)),
                Text('Rp 85k', style: luxuryTextStyle(size: 22)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jumlah Pesanan', style: luxuryTextStyle(size: 18)),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () { if(quantity > 1) setState(() => quantity--); }),
                        Text('$quantity', style: luxuryTextStyle(size: 20)),
                        IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () => setState(() => quantity++)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGold, foregroundColor: Colors.black),
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                    child: const Text('ADD TO CART'),
                  ),
                )
              ],
            ),
          ),
          Positioned(top: 20, left: 20, child: CircleAvatar(backgroundColor: Colors.black45, child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)))),
        ],
      ),
    );
  }
}

// --- SCREEN 6: CART ---
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text('My Basket', style: luxuryTextStyle())),
      body: Column(
        children: [
          Expanded(child: ListView(padding: const EdgeInsets.all(20), children: [LuxuryCard(child: Text('Premium Tumpeng Mini (1x)', style: luxuryTextStyle(size: 16)))])),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: AppColors.cardSurface, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGold, foregroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: const Text('PROCEED TO CHECKOUT'),
            ),
          )
        ],
      ),
    );
  }
}

// --- SCREEN 7: CHECKOUT ---
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LuxuryScaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text('Checkout', style: luxuryTextStyle())),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LuxuryCard(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: AppColors.primaryGold),
                title: Text('Fin\'s Garage (E30 Base)', style: luxuryTextStyle(size: 14)),
                subtitle: const Text('Jl. Balap No. 30, Jakarta Selatan'),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGold, foregroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Placed Successfully!')));
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              child: const Text('PLACE ORDER'),
            )
          ],
        ),
      ),
    );
  }
}