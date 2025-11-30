import 'package:flutter/material.dart';
import 'package:mobile/components/profile_widget/menu_list.dart';
import 'package:mobile/screen/auth/item_list.dart';
import 'package:mobile/services/auth_service.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override build(BuildContext context) {
    //TODO : Implement build
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 70,),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                        'Profile' ,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 19,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 1116 - 317 - 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 7,),
                      Container(
                        width: 97,
                        height: 99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset('assets/images/pp.jpg'),
                      ),
                      Text(
                        'Timothy Manuel Chandra',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'timothymanuel@students.usu.ac.id',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.6)
                        ),
                      ),
                      const SizedBox(height: 26,),
                      Container(
                          width: 372,
                          height: 68,
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(.24)
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // const SizedBox(width: 22,),
                              Image.asset('assets/images/coin-icon.jpg'),
                              const SizedBox(width: 5,),
                              Row(
                                children: [
                                  Text(
                                    '9999',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text(
                                    'E-Point',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 46,
                                color: Colors.black.withOpacity(.6),
                              ),
                              Container(
                                width: 126,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff009421),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                  ),
                                  child: Text('Tukarkan'),
                                ),
                              ),
                            ],
                          )
                      ),
                      const SizedBox(height: 25,),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: ListView(
                            children: [
                              MenuList(
                                  title: 'Histori Transaksi',
                                  image: 'assets/images/histori.jpg'
                              ),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemListScreen()
                                    )
                                  );
                                },
                                child:  MenuList(
                                    title: 'Tugas',
                                    image: 'assets/images/tugas.jpg'
                                ),
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Peringkat',
                                  image: 'assets/images/peringkat.jpg'
                              ),

                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Notifikasi',
                                  image: 'assets/images/notifikasi.jpg'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Kebijakan Privasi',
                                  image: 'assets/images/privasi.jpg'
                              ),

                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Medali-Ku',
                                  image: 'assets/images/medali.jpg'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Ganti Password',
                                  image: 'assets/images/password.jpg'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Pusat Bantuan',
                                  image: 'assets/images/bantuan.jpg'
                              ),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: () => AuthService().signOut(),
                                child: MenuList(
                                    title: 'Logout',
                                    image: 'assets/images/peringkat.jpg'),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}