mulai:-
hipotesis(Penyakit),
write('Anda Mengalami '),
write(Penyakit),
undo.


hipotesis(kurap)     :- kurap, !.
hipotesis(bisul)      :- bisul, !.
hipotesis(campak)  :- campak, !.
hipotesis(unknown). 



kurap :-
gejala(lingkaran_merah),
gejala(bercak_putih_pada_lingkaran),
gejala(terasa_gatal),
gejala(kulit_menebal),
gejala(kulit_terkelupas),
write('Harap Melakukan:'),
nl,
write('1: Pakai Pakaian yang Longgar dan Sering Mandi'),
nl,
write('2: Keringkan Area Sering Berkeringat'),
nl,
write('3: Minum Vitamin Kekebalan Tubuh'),
nl.

bisul :-
gejala(terdapat_benjolan),
gejala(kulit_merah_disekitar_benjolan),
gejala(berisi_nanah),
gejala(terdapat_pada_bagian_tubuh_yang_lembab),
gejala(terasa_perih),
write('Harap Melakukan:'),
nl,
write('1: Gunakan kain bersih dan hangat untuk mengompres bisul'),
nl,
write('2: Jaga kebersihan area sekitar bisul'),
nl,
write('3: Jika bisul terasa nyeri, minum obat pereda nyeri yang dijual bebas'),
nl.

campak :-
gejala(benjolan_merah_kecil),
gejala(batuk),
gejala(suhu_tubuh_naik),
gejala(benjolan_menyebar_keseluruh_tubuh),
gejala(benjolan_ada_sekitar_10_hari),
write('Harap Melakukan:'),
nl,
write('1: Minum banyak air untuk mencegah dehidrasi'),
nl,
write('2: Banyak istirahat dan hindari sinar matahari selama mata masih sensitif terhadap cahaya'),
nl,
write('3: Minum obat penurun demam dan obat pereda sakit serta nyeri'),
nl.



ask(Question) :-
write('apakah anda memiliki gejala '),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.


gejala(S) :-
 (yes(S)
  ->
   true ;
 (no(S)
  ->
   fail ;
 ask(S))).


undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.