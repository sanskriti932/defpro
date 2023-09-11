beginning :-
nl,
print_formatted ("HELLO! WELCOME TO:", green), nl, nl, nl,
sleep (0.3),
print_formatted("~~~~~~~~~~~~~~~~~~~~~~~~~~|_MUSIC LIK|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",red), nl, nl, nl,
sleep (0.6),
stampa_formattato("_____________________________________________________________________________________________________________________________________________________________________________________________", black), nl,
stampa_formattato("_____________________________________________________________________________________________________________________________________________________________________________________________", black), nl,
description.
need (User, Italian): - check(User,"Do you prefer Italian artists [yes / no]?", Italian).
need(User, foreign): - check(User,"Do you prefer foreign artists [yes|no] ?", foreign).
need(User,Modern): - check(User," Do you like modern songs more [yes / no]?", modern).
need(User, group): - check(User,"Do you prefer a group [yes|no] ?", group).
need(User, single): -check(User," Do you prefer a solo artist[yes|no] ?", single).
need(User, rock) :- check(User,"Do you like rock [yes|no] ?", rock).
need(User, dance): - check(User,"Do you prefer dance [yes|no] ?", dance).
need(User, pop) :- check(User,"Do you like pop songs [yes|no]?", pop).
need(User, sad) :- check(User,"Do you want a melancholy song [yes|no] ?", sad).
need(User, ninety): - check (User," Do you like old songs more(80-90) [yes / no]?", ninety).
need(User, charge): - check(User,"Do you want something that gives you charge [yes|no] ?", charge).
need(User, slow) :- check(User, "Do you prefer a slow song [yes|no]?", slow).
need(User, happy) :- check(User, "do you prefer a song with a happy lyrics [yes|no]?", happy).
need (User, puglia): - check (User, " Are you Pugliese [yes|no] ?", puglia).
need(User, two thousand): - check (User, " Do you prefer a song released after 2000 [yes|no]?", thousand).
need(User,recent): - check(User, "Do you like something recently released [yes|no] ?", recent).
need(User, disco): - check (User ," Do you like disco songs [yes|no]?", disco).

year("1996").
year("1980").
year("1991").
year("2017").
year("2011").
year("2008").
year("2000").
year("2012").
year("2010").
year("2009").
year("1999").
year("2015").

assigned("1996",albachiara_album).
assigned("1980",back_in_black_album).
assigned("1991",dangerous).
assigned("2017",divided).
assigned("2008", four_mark).
assigned("2000",crush).
assigned("2011", _del_mio_caos dimensions).
assigned("2012", all_the_little_lights).
assigned("2009",back_to_bedlam).
assigned("1999", chansons_for_the_heart).
assigned("2015", five).
assigned("2010",the_end).

song(back_in_black,acdc). 
song(albachiara,vasco_rossi).
song(black_or_white,michael_jackson).
song(piazza_grande,lucio_dalla).
song(perfect,ed_sheeran).
song(it_s_my_life,bon_jovi).
song(vieni_a_ballare_in_puglia,caparezza).
song(let_her_go,passenger).
song(you_are_beautiful,james_blunt).
song(i_gotta_feeling,black_eyed_peas).
song(l_amour_toujours,gigi_dagostino).
song(sugar,maroon_five).

album(acdc,back_in_black_album).
album(vasco_rossi,albachiara_album).
album(michael_jackson,dangerous).
album(ed_sheeran, diviso).
album(lucio_dalla,quattro_marzo).
album(bon_jovi, crush).
album(caparezza, le_dimensioni_del_mio_caos).
album(passenger, all_the_little_lights).
album(james_blunt,back_to_bedlam).
album(gigi_dagostino,chansons_for_the_heart).
album(maroon_five,five).
album(black_eyed_peas,the_end).

artist (User, bon_ovi) :-
need(User, foreign),
need(User,group),
need(User, rock),
need(User, ninety),
need(User, charge),
need(User, happy),!.
artist (User, acdc) :-
need(User, foreign),
need(User,group),
need(User, rock),
requirement (User, ninety),
need(User, charge),!.
artist (User, maroon_five) :-
need(User, foreign),
need(User,group),
need(User, pop),
need(User, happy),
need (User, two thousand),
need(User,modern),
need(User,recent),!.
artist (User, black_eed) :-
need(User, foreign),
need(User,group),
need(User, dance),
need(User, pop),
requirement (User, charge),
need(User, happy),
need (User, two thousand),
Moderna(User,modern),
need(User, disco),!.
artist (User, michael_ack) :-
need(User, foreign),
need(User,individual),
need(User, pop),
need(User, ninety),!.
artist (User, ed_sheeran) :-
need(User, foreign),
need(User,individual),
need(User, happy),
need (User, two thousand),
need(User,modern),
need(User,recent),!.
artist (User, passenger) :-
need(User, foreign),
need(User,individual),
need(User, pop),
need(User, sad),
need(User,modern),
need(User, two thousand),!.
artist (User ,am ):-
need(User, foreign),
need(User,individual),
need (User, slow),
need(User, happy),
Moderna(User,modern),
need(User, two thousand),!.
artist (User, vasco_rossi) :-
need(User, Italian),
need(User,individual),
need(User, rock),
requirement (User, ninety),
need(User, happy),!.
artist (User,lucio_from) :-
need(User, Italian),
need(User,individual),
need(User, sad),
need(User, ninety),
need(User, slow),!.
artist (User, caparezza) :-
need(User, Italian),
need(User, pop),
need(User,modern),
need(User,individual),
need(User, charge),
need(User, happy),
need (User, puglia),
need(User, two thousand),!.
artist (User, gigi_dagostino) :-
need (User, Italian),
need(User,individual),
need(User, dance),
need(User, ninety),
need(User, charge),
need(User, happy),
need(User, disco),!.

artist (_, "No Artist").


	ask (User, Question, Need) :-
		print_formatted (User, blue), print_formatted (',', blue), print_formatted (Question, blue),
		read (N),
		sleep (0.7),
		nl,
print_formatted('______________________________________________________________________________________________________________________________________________________________________________________________',black),nl,		
		((N == yes)
		             - >assert (yes(Question),assert(Fact(Need));
		                assert (no (Question)),fail)).
	
	% predicates that are modified time by time, i.e. every time a new thing is asserted it must modify the predicate in the knowledge base
	:- dynamic yes/1, no/1, fact/1.
	
	verification(P,S,X) :-
	   (yes(S) -> true ;
			(no(S) -> fail ; ask(P,S,X))).
	
	
	% undo cancels a transaction and any transactions nested in it, takes away the choices made from the knowledge base
	undo:- retract (yes(_)),fail.
	undo:- retract (no (_)), fail.
	undo:- retract (fact (_)), fail.
	undo.
	
	% universal predicate for formatted prints
	print_formatted (P, C):-
		ansi_format ([bold,fg (C)],P, []).    % formats text with ansi attributes
	
	print_formated2 (P, C):-
		write ('\n'), w rite (''), print_formatted (' - ' , C),print_formatted (P,C).
	
	
	print_exigences (Artist):-
	 	print_formatted ('\Ni chose:', black), print_formatted (Artist, blue), print_formatted ("because you have the following needs:", black),
	 	forall (fact(P),print_format2 (P,blue)).   % fact (P) is the generator and the following creates the effect
	
	print_album (Artist) :-
		findall(album, album(Artist,X,L),
		_slist(L).
	
	print_song (Artist) :-
		findall(song, song(X, Artist), L),
		_slist(L).

    get_anno_support ([],_).
	get_anno_support ([H|T], P):-
		findall (Year, assigned (Year, H), L),
		append (L, P, Ris),
		get_anno_support(T,Ris).
	
	
	get_year([H|T]):-
		findall (Year, assigned (Year, H), L),
		get_anno_support (T,L), 
		filter(L). 
		
	
	filter (L):-
		_duplicated(L,Ris),
		_slist(Ris).
	
	
	print_artist_reference (Artist) :-
		findall (album, album (Artist,Artista), L), % specializations that if achieved year allow you to recommend a song by a certain Artist
		get_year(L).
		
	
	print_knowledge _artists:-
		findall (Artist, Song (_, Artist),L), % L is the list of Artist instances for which the song(_,Artist) property is true, if there is no Artist rest empty list
		_duplicated(L,L1),              
		_slist(L1).
	
	
	scroll_list([]).
	_slist([H|T]):-
		call (print_formatato2 (H, blue)), % requires invocation of the interpreter within the interpreter itself, formatted print evaluation2 is requested
		_slist(T).
	
	
	_duplicate([],[]).
	_duplicated([H | T], L) :- 
		member (H, T), % If H is list element T
		_duplicate(T, L).
	
	_duplicate([H|T],[H|T1]) :- not(member(H,T)),
									   _duplicate(T,T1).
	
	 
	 
	check_artist ( _ , Artist, [H|T]) :-
			(
	           (member (Artist, [H|T]), not (Artist== "No Artist")) - > fail
			   ; true
			).
pt (User):-
artist (User,Artist), % the Artist predicate will always "return" true, at which point by means of the defined predicate I see if the Artist has been found
findall (artista, artist (User, X), L), % L is wrapped with findall
(
(not (check_artist (User, Artist, L))) - >
print_formatted (User, black),
print_formatted(', based on my following list of Artists:', black),
print_knowledge _artists,
print_formatted ('\n \ n Highly recommend:', black),
print_formatted (Artist, blue),
print_formatted ('.',black),
print_formatted('\n\nprecisely album:', black),
print_album (Artist),
print_formatted ('.',blue),
print_formatted('\n\nBrano recommended:', black),
print_song(Artist),
print_formatted ('.',black),
print_formatted('\n\n Year of publication:', black),
print_artist_reference (Artist),
print_formatted ('.',black)
; print_formatted ('I'm sorry, I'm not able to rate the song suitable for you!',black)

),

nl, nl,
not (Artist== "No Artist") - >
(
stampa_formattato('______________________________________________________________________________________________________________________________________________________________________________________________',black),nl,

print_formatted (User, blue), print_formatted (',', blue), print_formatted('Would you like to know the reason for my choice [yes/no] ? ',black),
read (R),
(
(R==si) -> print_exigencies (Artist), undo, end
; sleep(1)
)
); true,
undo, % since we do not cut the undo are executed in quotation marks resulting in retracts from the database of previous asserted facts
end.

end :-
nl, nl, nl, nl,
sleep (0.6),
print_formatted('______________________________________________________________________________________________________________________________________________________________________________________________',black),nl,
print_formatted("***************|_ THANKS AND GOOD LISTENING _|****************",red), nl, nl.


description :-
write ('The purpose of Musicou Answer our questions and you will discover the most" suitable " song for you based on your preferences! Welcome to Music Y '), nl,
write('what is your name ? '),
read (N), nl,
stampa_formattato('______________________________________________________________________________________________________________________________________________________________________________________________',black),nl,
(N = = @(null) - > nl,print_formatted('Thanks for using me!, Goodbye', black), nl,
end, fail
; pt (N)
).
