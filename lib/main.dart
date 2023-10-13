import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lembar Penilaian Ujian'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController ujianTertulis = TextEditingController();
  TextEditingController ujianTertulisPercent = TextEditingController();
  TextEditingController ujianPraktek = TextEditingController();
  TextEditingController ujianPraktekPercent = TextEditingController();
  TextEditingController nilaiMurni = TextEditingController();
  TextEditingController gradeSiswa = TextEditingController();
  bool checkBoxMi = false;
  bool checkBoxTK = false;
  String pilihanKuliah = '';
  num totalBiaya = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Ujian Tertulis'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: ujianTertulis,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            ujianTertulisPercent.text =
                                (num.parse(value) * 0.4).toString();
                            nilaiMurni.text =
                                (num.parse(ujianTertulisPercent.text) +
                                        num.parse(ujianPraktekPercent.text))
                                    .toString();
                            if (num.parse(nilaiMurni.text) < 60) {
                              gradeSiswa.text = 'Gagal';
                            } else if (num.parse(nilaiMurni.text) >= 60) {
                              gradeSiswa.text = 'Lulus';
                            } else {
                              gradeSiswa.text = '';
                            }
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text('X 40%'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      enabled: false,
                      controller: ujianTertulisPercent,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Ujian Praktek'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: ujianPraktek,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            ujianPraktekPercent.text =
                                (num.parse(value) * 0.6).toString();
                            nilaiMurni.text =
                                (num.parse(ujianTertulisPercent.text) +
                                        num.parse(ujianPraktekPercent.text))
                                    .toString();
                            if (num.parse(nilaiMurni.text) < 60) {
                              gradeSiswa.text = 'Gagal';
                            } else if (num.parse(nilaiMurni.text) >= 60) {
                              gradeSiswa.text = 'Lulus';
                            } else {
                              gradeSiswa.text = '';
                            }
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text('X 60%'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      enabled: false,
                      controller: ujianPraktekPercent,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Nilai Murni Siswa'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: nilaiMurni,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '0',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Text('Grade'),
                  const SizedBox(
                    width: 32,
                  ),
                  SizedBox(
                    width: 60,
                    child: TextField(
                      enabled: false,
                      controller: gradeSiswa,
                    ),
                  ),
                ],
              ),
              const Text('Pilih Jurusan'),
              Row(
                children: [
                  Checkbox(
                    value: checkBoxMi,
                    onChanged: (value) {
                      if (value!) {
                        totalBiaya = totalBiaya + 250000;
                      } else {
                        totalBiaya = totalBiaya - 250000;
                      }
                      setState(() {
                        checkBoxMi = value;
                      });
                    },
                  ),
                  const Text('MI'),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text('Biaya Jurusan MI'),
                  const SizedBox(
                    width: 24,
                  ),
                  const SizedBox(
                    width: 100,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Rp 250.000',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBoxTK,
                    onChanged: (value) {
                      if (value!) {
                        totalBiaya = totalBiaya + 300000;
                      } else {
                        totalBiaya = totalBiaya - 300000;
                      }
                      setState(() {
                        checkBoxTK = value;
                      });
                    },
                  ),
                  const Text('TK'),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text('Biaya Jurusan TK'),
                  const SizedBox(
                    width: 24,
                  ),
                  const SizedBox(
                    width: 100,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Rp 300.000',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  //radio button
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        RadioListTile(
                          title: const Text("Pagi / Siang"),
                          value: "pagi",
                          groupValue: pilihanKuliah,
                          onChanged: (value) {
                            setState(() {
                              pilihanKuliah = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text("Sore / Malam"),
                          value: "malam",
                          groupValue: pilihanKuliah,
                          onChanged: (value) {
                            setState(() {
                              pilihanKuliah = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Text('Biaya Waktu'),
                        SizedBox(
                          width: 24,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText:
                                  'Rp ${(pilihanKuliah == "pagi" ? 500000 : 1000000)}',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Total Biaya'),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText:
                            'Rp ${totalBiaya + (pilihanKuliah == "pagi" ? 500000 : 1000000)}',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
