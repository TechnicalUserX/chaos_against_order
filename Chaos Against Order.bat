@echo off

	::[=====================================================]	
	::Setting Up

	setlocal EnableDelayedExpansion
	cd cao_files
	color 3f
	mode con:cols=120 lines=30
	title Chaos Against Order
	set mega_strike=false
	
	set enemy_use_mega_strike=false
	
	set /a win_streak=0
	set /a loose_streak=0
	
	set choice_select_item=null
	set item_use_number=null
	set gonna_use_item=false
	
	set skip_battle_scene_choice=false
	
	call :setup_variables
	

	
	
	
	
	
	
	
	
	goto :main
	
	::[=====================================================]
	
	:set_gamemode_normal
	cls
	color 8f
	echo.
	echo  !text_18!
	
	if !user_side!==order (
	set /a user_order_items_health_potion=1
	call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
	set /a user_order_items_elixir=1
	call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
	set /a user_order_items_smoke=2
	call :change_dll_var_save user_order_items_smoke !user_order_items_smoke!
	set /a user_order_items_speed_booster=1
	call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
	set /a user_order_items_speed_decreaser=0
	call :change_dll_var_save user_order_items_speed_decreaser !user_order_items_speed_decreaser!
	set /a user_order_items_mega_strike=0
	call :change_dll_var_save user_order_items_mega_strike !user_order_items_mega_strike!

	set enemy_chaos_health_constant=450
	call :change_dll_var_save enemy_chaos_health_constant 450
	set enemy_chaos_attack_constant_start=25
	call :change_dll_var_save enemy_chaos_attack_constant_start 25
	set enemy_chaos_attack_constant_end=45
	call :change_dll_var_save enemy_chaos_attack_constant_end 45
	set enemy_chaos_speed_constant_start=40
	call :change_dll_var_save enemy_chaos_speed_constant_start 40
	set enemy_chaos_speed_constant_end=70
	call :change_dll_var_save enemy_chaos_speed_constant_end 70
	)
	
	if !user_side!==chaos (
	set user_chaos_items_number=5
	call :change_dll_var_save user_chaos_items_number 5
	set enemy_order_health_constant=450
	call :change_dll_var_save enemy_order_health_constant 450
	set enemy_order_attack_constant=30
	call :change_dll_var_save enemy_order_attack_constant 30
	set enemy_order_speed_constant=55
	call :change_dll_var_save enemy_order_speed_constant 55
	)
	
	
	
	
	

	set /a user_level=1
	call :change_dll_var_save user_level !user_level!
	set /a user_xp=0
	call :change_dll_var_save user_xp !user_xp!
	set user_money=150
	call :change_dll_var_save user_money !user_money!
	
	
	cls
	goto :eof
	
	::[-----------------------------------------------------]
	
	:set_gamemode_hardcore
	cls
	color 8f
	echo.
	echo  !text_18!
	if !user_side!==order (
	set user_order_items_health_potion=1
	call :change_dll_var_save user_order_items_health_potion 1
	set user_order_items_elixir=0
	call :change_dll_var_save user_order_items_elixir 0
	set user_order_items_smoke=0
	call :change_dll_var_save user_order_items_smoke 0
	set user_order_items_speed_booster=0
	call :change_dll_var_save user_order_items_speed_booster 0
	set user_order_items_speed_decreaser=0
	call :change_dll_var_save user_order_items_speed_decreaser 0
	set user_order_items_mega_strike=0
	call :change_dll_var_save user_order_items_mega_strike 0

	set enemy_chaos_health_constant=550
	call :change_dll_var_save enemy_chaos_health_constant 550
	set enemy_chaos_attack_constant_start=30
	call :change_dll_var_save enemy_chaos_attack_constant_start 30
	set enemy_chaos_attack_constant_end=50
	call :change_dll_var_save enemy_chaos_attack_constant_end 50
	set enemy_chaos_speed_constant_start=45
	call :change_dll_var_save enemy_chaos_speed_constant_start 45
	set enemy_chaos_speed_constant_end=75
	call :change_dll_var_save enemy_chaos_speed_constant_end 75
	)
	
	if !user_side!==chaos (
	set user_chaos_items_number=1
	call :change_dll_var_save user_chaos_items_number 1
	set enemy_order_health_constant=550
	call :change_dll_var_save enemy_order_health_constant 550
	set enemy_order_attack_constant=35
	call :change_dll_var_save enemy_order_attack_constant 35
	set enemy_order_speed_constant=60
	call :change_dll_var_save enemy_order_speed_constant 60
	)
	
	
	
	set enemy_team_number=30000
	call :change_dll_var_save enemy_team_number 30000
	set user_team_number=20000
	call :change_dll_var_save user_team_number 20000
	set user_money=50
	call :change_dll_var_save user_money 50
	set user_level=1
	call :change_dll_var_save user_level 1
	set user_xp=0
	call :change_dll_var_save user_xp 0
	
	
	cls
	goto :eof
	
	::[=====================================================]
	
	:set_user_stats
	
	if !user_side!==order (
	cls
	color 8f
	echo.
	echo  !text_18!
	set user_order_health_constant=500
	call :change_dll_var_save user_order_health_constant 500
	set user_order_attack_constant=40
	call :change_dll_var_save user_order_attack_constant 40
	set user_order_speed_constant=60
	call :change_dll_var_save user_order_speed_constant 50
	)
	
	
	
	
	if !user_side!==chaos (
	cls
	color 8f
	echo.
	echo  !text_18!
	set user_chaos_health_constant=500
	call :change_dll_var_save user_chaos_health_constant 500
	set user_chaos_attack_constant_start=20
	call :change_dll_var_save user_chaos_attack_constant_start 20
	set user_chaos_attack_constant_end=45
	call :change_dll_var_save user_chaos_attack_constant_end 45
	set user_chaos_speed_constant_start=35
	call :change_dll_var_save user_chaos_speed_constant_start 35
	set user_chaos_speed_constant_end=70
	call :change_dll_var_save user_chaos_speed_constant_end 70
	)
	
	cls
	goto :eof
	
	::[=====================================================]
	
	:setup_variables
	for /f "tokens=1-2" %%a in ( database.cao ) do (
	set %%a=%%b
	) 
	for /f "tokens=1-2" %%a in ( save.cao ) do (
	set %%a=%%b
	)
	goto :eof

	::[=====================================================]	

	:change_dll_var_database
	for /f "tokens=1-2" %%a in ( database.cao ) do (
	if %%a==%1 (
	echo %%a %~2>>database_raw.cao
	)else (
	echo %%a %%b>>database_raw.cao
	)
	)
	del database.cao
	ren database_raw.cao database.cao
	goto :eof
	
	::[=====================================================]

	:change_dll_var_save
	for /f "tokens=1-2" %%a in ( save.cao ) do (
	if %%a==%1 (
	call :echo_output_save "%%a" "%~2"
	)else (
	call :echo_output_save "%%a" "%%b"
	)
	)
	del save.cao
	ren save_raw.cao save.cao
	goto :eof
	
	:echo_output_save
	echo ^%~1 ^%~2>>save_raw.cao
	goto :eof
	
	::[=====================================================]
	
	:create_string
	set /a takeaway=4
	set string=%2
	echo %string%>var.txt
	for /f "useback tokens=*" %%a in ( '%string%' ) do (
	if %string%==%%~a (
	set /a takeaway=2
	)
	set string=%%~a 
	)
	set %1=%string%
	for %%I in ( var.txt ) do (
	set /a %1_length=%%~zI - %takeaway%
	)
	del var.txt
	
	::[===========================================================================================]
	::[===========================================================================================]
	::[===========================================================================================]


	:main
	

		
	
	
	if %first_time%==true (

	call :graphics_start_alternate_1
	call :graphics_language
	call :change_dll_var_database language !choice_language!
		
		set language=!choice_language!
		
		for /f "tokens=1-2 delims=," %%a in ( !language!.lang ) do (
		set %%a=%%~b
		)
		
	
		
		
		call :graphics_welcome	
		call :change_dll_var_save user_side !choice_side!
		call :change_dll_var_save enemy_side !enemy_side!
		set user_side=!choice_side!
		call :graphics_set_username	
		call :change_dll_var_save username !username!	
		set username=!username!	
		call :graphics_introduce_character
		call :set_user_stats	
		call :graphics_gamemode
		
		
		
		
		
		
		
		
		call :change_dll_var_database first_time false
		cd..
		call "Chaos Against Order.bat"
		
	)else (
	
	
		for /f "tokens=1-2 delims=," %%a in ( !language!.lang ) do (
		set %%a=%%~b
		)
		call :graphics_start_alternate_1
		
	)
	

	::call :TESTING
	
	if !user_side!==order (
	set user_color=9f
	set enemy_color=cf
	)
	if !user_side!==chaos (
	set user_color=cf
	set enemy_color=9f
	)

	goto :graphics_mainmenu

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	goto :eof
	
	::[===========================================================================================]
	::[===========================================================================================]
	::[===========================================================================================]	
	::Animations	
	
		:graphics_start
		color 8f
		cls
		
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	call colorchar.exe /88 "                           "   
	call colorchar.exe /cc "      "   
	call colorchar.exe /88 "               "
	call colorchar.exe /77 "      "
	call colorchar.exe /88 "                 "
	call colorchar.exe /11 "          "
	echo.
	call colorchar.exe /88 "                         "   
	call colorchar.exe /cc "  "   
	call colorchar.exe /88 "                    "
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "    "
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "               "
	call colorchar.exe /11 "  "
	call colorchar.exe /88 "        "
	call colorchar.exe /11 "  "
	echo. 
	call colorchar.exe /88 "                         "   
	call colorchar.exe /cc "  "  
	call colorchar.exe /88 "                    "
	call colorchar.exe /77 "      "
	call colorchar.exe /88 ""
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "               "
	call colorchar.exe /11 "  "
	call colorchar.exe /88 "        "
	call colorchar.exe /11 "  "
	echo.
	call colorchar.exe /88 "                         "   
	call colorchar.exe /cc "  "  
	call colorchar.exe /88 "                    "
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "    "
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "               "
	call colorchar.exe /11 "  "
	call colorchar.exe /88 "        "
	call colorchar.exe /11 "  "
	echo.
	call colorchar.exe /88 "                           "   
	call colorchar.exe /cc "      "  
	call colorchar.exe /8f " HAOS"
	call colorchar.exe /88 "         "
	call colorchar.exe /77 "  "
	call colorchar.exe /88 "    "
	call colorchar.exe /77 "  "
	call colorchar.exe /8f " GAINST"
	call colorchar.exe /88 "         "
	call colorchar.exe /11 "          "
	call colorchar.exe /8f " RDER"
	call colorbox.exe /8f 22 5 87 13 /D
	echo.
	echo.
	echo.
	echo.
	echo.
	if !first_time!==true (
	echo Press any key to continue...
	)else (
	echo         !text_17!
	)
	echo                                         
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	call colorchar.exe /7f " !text_141! Technical_User_X "
		
		pause>nul
		cls
		goto :eof
		
	::[=====================================================]

		:graphics_language
		color 8f
		cls
	echo.
	echo  Choose a language
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                          TURKCE
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                          ENGLISH
	call colorbox.exe /8f 40 5 80 12 /D
	call colorbox.exe /8f 40 13 80 20 /D
	set box_lang_1=42 6 78 11
	set box_lang_2=42 14 78 19
	call getinput.exe /M %box_lang_1% %box_lang_2% /H 7f  
	if %errorlevel% equ 1 (
	set choice_language=tur
	)
	if %errorlevel% equ 2 (
	set choice_language=eng
	)
	cls
	goto :eof
	
	::[=====================================================]

	:graphics_welcome
	color 8f
	cls
	type story_!language!.txt
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                               CHAOS                                             ORDER
	echo.
	call colorbox.exe /8f 12 12 52 22 /D
	call colorbox.exe /8f 62 12 102 22 /D
	set box_side_1=13 13 51 21
	set box_side_2=63 13 101 21
	call getinput.exe /M !box_side_1! !box_side_2! /H cf 9f
	if !errorlevel!==1 (
	set choice_side=chaos
	set enemy_side=order
	)
	
	if !errorlevel!==2 (
	set choice_side=order
	set enemy_side=chaos
	)
	
	
	
	cls
	goto :eof
	
	::[=====================================================]
	
	:graphics_introduce_character
	
	if !user_side!==order (
	call :graphics_introduce_order
	)
	
	
	if !user_side!==chaos (
	call :graphics_introduce_chaos
	)
	
	goto :eof
	
	::[=====================================================]
	
	:graphics_set_username
	echo.
	echo  !text_1!
	echo.
	set /p username= []-
	goto :eof
	
	::[=====================================================]
	
	:graphics_introduce_order
	cls
	echo.
	echo.
	echo   !text_2!
	echo.
	echo   !text_3!
	echo   !text_4!
	echo.
	echo   !text_5!
	echo   !text_6!
	echo   !text_7!
	echo.
	echo.
	echo   !text_8!
	echo   !text_9!
	call colorbox.exe /8f 1 1 100 14
	pause>nul
	cls
	goto :eof
	
	::[=====================================================]
	
	:graphics_introduce_chaos
	cls
	echo.
	echo.
	echo   !text_10!
	echo.
	echo   !text_11!
	echo   !text_12!
	echo.
	echo   !text_13!
	echo   !text_14!
	echo   !text_15!
	echo.
	echo.
	echo   !text_16!
	echo   !text_17!
	call colorbox.exe /8f 1 1 100 14
	pause>nul
	cls
	goto :eof

	::[=====================================================]
	
	:graphics_mainmenu
	cls
	color 3f
	call colorchar.exe /8f " [!username!] "
	call colorchar.exe /8f " !text_29! "
	call colorchar.exe /8a "!user_money! "

	if !user_side!==order (
	call colorchar.exe /71 " Master Order !user_team_number! "
	call colorchar.exe /7f ":"
	call colorchar.exe /7c "!enemy_team_number! Chaos Team "
	call colorchar.exe /8f " "
	)
	if !user_side!==chaos (
	call colorchar.exe /7c " Chaos Team !user_team_number! "
	call colorchar.exe /7f ":"
	call colorchar.exe /71 " !enemy_team_number! Master Order "
	call colorchar.exe /8f " "
	
	)
	

	echo.
	echo.
	echo.
	echo.
	call colorchar.exe /33 "                       "
	call colorchar.exe /ff "     "
	echo.
	call colorchar.exe /33 "                      "
	call colorchar.exe /ff "        "
	echo.
	echo.
	call colorchar.exe /33 "                                                        "
	call colorchar.exe /ff "         "
	echo.
	call colorchar.exe /33 "                                                      "
	call colorchar.exe /ff "               "
	echo.
	echo.
	echo.                                                    
	echo.                                                    
	call colorchar.exe /2f "                                                                                                                       "
	echo.
	call colorchar.exe /2f "                                                                                                                       "
	echo.
	call colorchar.exe /2f "                                                                                                                       "
	echo.
	call colorchar.exe /2f "                                                                                                                       "
	echo.
	call colorchar.exe /2f "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	echo.
	call colorchar.exe /af "                                                                                                                       "
	
	::Market
	call colorbox.exe /77  83 25 102 26 /D
	call colorbox.exe /88  85 20 100 25
	call colorbox.exe /88  86 21 99 24
	call colorbox.exe /88  87 22 98 23
	call colorbox /bb  97 24 98 25
	::Market_Top
	call colorbox.exe /44 85 19 86 20
	call colorbox.exe /ff 87 19 88 20
	call colorbox.exe /44 89 19 90 20
	call colorbox.exe /ff 91 19 92 20
	call colorbox.exe /44 93 19 94 20
	call colorbox.exe /ff 95 19 96 20
	call colorbox.exe /44 97 19 98 20
	call colorbox.exe /ff 99 19 100 20
	
	
	::Battle Tower
	call colorbox.exe /77  3 25 22 26 /D
	call colorbox.exe /88  5 20 20 25
	call colorbox.exe /88  6 21 19 24
	call colorbox.exe /88  6 16 19 24
	call colorbox.exe /88  7 22 18 23
	call colorbox.exe /bb  17 24 18 25
	::Battle Tower_Windows
	call colorbox.exe /bb  7 17 18 19
	call colorbox.exe /bb  7 17 18 18
	::Battle Tower Colors
	call colorbox.exe /22 16 21 17 22
	call colorbox.exe /ff 18 21 19 22
	
	
	
	
	
	
	
	
	::Building Bottom Plane
	call colorbox.exe /77 49 21 71 23
	
	::The way
	call colorbox.exe /77 25 20 60 21
	call colorbox.exe /77 24 17 25 20
	
	
	::Building Ours
	call colorbox.exe /88 50 15 70 19 /D
	call colorbox.exe /88 50 16 70 20 /D
	call colorbox.exe /88 50 17 70 21 /D
	call colorbox.exe /88 50 18 70 22 /D
	call colorbox.exe /88 50 19 70 21 /D
	call colorbox.exe /88 50 20 70 20 /D
	
	::Building Rival
	call colorbox.exe /88 24 11 27 13 /DD
	call colorbox.exe /bb 25 13 26 13
	call colorbox.exe /88 29 11 30 13 
	
	
	::Flag
	call colorbox.exe /88 75 12 76 22
	
	::Windows
	call colorbox.exe /bb 51 17 52 19 /D
	call colorbox.exe /bb 54 17 55 19 /D
	call colorbox.exe /bb 51 19 52 21 /D
	call colorbox.exe /bb 51 19 52 21 /D
	call colorbox.exe /bb 54 19 55 21 /D
	call colorbox.exe /bb 57 19 58 21 /D
	call colorbox.exe /bb 65 22 67 22

	
	if !user_side!==order (
	call colorbox.exe /11 76 12 86 15 /DD
	call colorbox.exe /cc 30 11 31 11
	
	)
	
	if !user_side!==chaos (
	call colorbox.exe /cc 76 12 86 15 /DD
	call colorbox.exe /11 30 11 31 11 
	)





	set box_mainmenu_choice_1=60 16 69 20
	set box_mainmenu_choice_2=86 21 94 24
	set box_mainmenu_choice_3=6 21 14 24
	call getinput.exe /M !box_mainmenu_choice_1! !box_mainmenu_choice_2! !box_mainmenu_choice_3! /H 77
	
	
	set choice_mainmenu=!errorlevel!
	if !choice_mainmenu!==1 (
	cls
	goto :graphics_base
	)
	
	if !choice_mainmenu!==2 (
	cls
	set choice_mainmenu=
	goto :graphics_market
	)
	
	if !choice_mainmenu!==3 (
	cls
	set choice_mainmenu=
	goto :graphics_battletower
	)
	
	
	
	
	cls
	goto :graphics_mainmenu
	goto :eof
	
	::[=====================================================]
	
	:graphics_gamemode
	color 8f
	cls
	echo.
	echo  !text_19!
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                       !text_20!               !text_23!
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                      !text_21!             !text_24!
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                      !text_22!               !text_25!
	echo.
	echo.
	echo.
	echo.
	call colorbox.exe /8F 10 5 40 10 /D
	call colorbox.exe /8F 10 11 40 16 /D
	call colorbox.exe /8F 10 17 40 22 /D
	set box_gamemode_1=11 6 39 9
	set box_gamemode_2=11 12 39 15
	set box_gamemode_3=11 18 39 21
	call getinput.exe /M !box_gamemode_1! !box_gamemode_2! !box_gamemode_3! /H 7a 7c 7f
	set choice_gamemode=!errorlevel!
	
	if !choice_gamemode!==1 (
	set game_mode=normal
	
	call :change_dll_var_save game_mode normal
	call :set_gamemode_normal
	
	
	
	set enemy_team_number=25000
	call :change_dll_var_save enemy_team_number 25000
	
	set user_team_number=25000
	call :change_dll_var_save user_team_number 25000
	
	
	
	cls
	)
	
	if !choice_gamemode!==2 (
	set game_mode=hardcore
	call :change_dll_var_save game_mode hardcore
	call :set_gamemode_hardcore
	cls
	)
	
	if !choice_gamemode!==3 (
	call :set_gamemode_normal
	cls
	echo.
	echo  !text_26!
	echo.
	call colorchar.exe /88 " "
	set /p choice_amount_your_team= !text_27!-
	echo.
	echo.
	call colorchar.exe /88 " "
	set /p choice_amount_enemy_team= !text_28!-
	echo.
	
	set game_mode=personal
	call :change_dll_var_save game_mode personal
	call :change_dll_var_save user_team_number !choice_amount_your_team!
	call :change_dll_var_save enemy_team_number !choice_amount_enemy_team!
	set user_team_number=!choice_amount_your_team!
	set enemy_team_number=!choice_amount_enemy_team!
	cls
	)
	
	
	cls
	goto :eof
	
	::[=====================================================]
	
	:graphics_base
	color 8f
	call colorchar.exe /78 "                                                                                                                       "
	echo.
	call colorchar.exe /8F " [ !text_30! ] "
	echo.
	echo.
	if !user_side!==order (
	echo  [=======================================]                                                        Console
	echo   !text_31! : !user_order_health_constant!
	echo   !text_32! : !user_order_attack_constant!
	echo   !text_33! : !user_order_speed_constant!
	echo   !text_34! : Master Order
	echo  [=======================================]
	echo   !text_29! : !user_money!
	echo  [=======================================]
	echo   !text_35! : !user_level!
	echo   !text_36! : !user_xp!
	echo  [=======================================]
	echo   !text_37!
	echo   !text_38! : !user_order_items_health_potion!  [!text_31! +100 x Level]
	echo   !text_39! : !user_order_items_elixir!  [!text_32! +30 x Level]
	echo   !text_40! : !user_order_items_smoke!
	echo   !text_41! : !user_order_items_speed_booster! [+10 x Level]
	echo   !text_42! : !user_order_items_speed_decreaser! [-20 x Level]
	echo   !text_43! : !user_order_items_mega_strike! [!text_32! x 5]
	echo  [=======================================]
	)
	if !user_side!==chaos (
	echo  [=======================================]                                                        Console
	echo   !text_31! : !user_chaos_health_constant!
	echo   !text_44! : !user_chaos_attack_constant_start!-!user_chaos_attack_constant_end!
	echo   !text_46! : !user_chaos_speed_constant_start!-!user_chaos_speed_constant_end!
	echo   !text_34! : Chaos Team
	echo  [=======================================]
	echo   !text_29! : !user_money!
	echo  [=======================================]
	echo   !text_35! : !user_level!
	echo   !text_36! : !user_xp!
	echo  [=======================================]
	echo   !text_37!
	echo   !text_45! : !user_chaos_items_number!
	echo  [=======================================]
	echo.
	echo.
	echo.
	echo.
	echo.
	)
	echo                                                                                                   !text_47!
	call colorbox.exe /8f 89 19 111 26
	call colorbox.exe /8f 93 1 109 5
	
	
	set box_base_1=90 20 110 25
	set box_base_2=94 2 108 4
	call getinput.exe /M !box_base_1! !box_base_2! /H f0
	
	set choice_base=!errorlevel!
	if !choice_base!==1 (
	cls
	goto :graphics_mainmenu
	
	)
	if !choice_base!==2 (
	call :console
	cls
	goto :graphics_base
	
	)
	
	
	goto :eof
	
	::[=====================================================]
	
	:graphics_market
	cls
	color 8f
	call colorchar.exe /7f "                                                                                                                       "
	echo.
	echo  [ !text_48! ] [ !text_29! : !user_money! ]
	echo.
	
	if !user_side!==order (
	echo.
	echo      !text_49! !text_50! !text_51! !text_62!
	echo.
	echo.
	echo.
	echo      !text_52!!text_53!!text_54!!text_63!
	echo      [-40]                [+20]                            [x3]             [-150]
	echo.
	echo      !text_55!!text_56!!text_57!!text_64!
	echo      [-70]                [+35]                            [x4]             [-175]
	echo.
	echo      !text_58!!text_59!!text_60!!text_65!
	echo      [-10]                [+50]                            [x2]              [-200]
	echo.
	echo      !text_61!         
	echo      [-100]
	echo.
	echo.
	echo.
	echo                                                                                                   !text_47!
	echo.
	echo.
	echo.
	call colorbox.exe /8f 1 3 20 25
	call colorbox.exe /8f 21 3 40 25
	call colorbox.exe /8f 41 3 70 25
	call colorbox.exe /8f 71 3 110 17
	call colorbox.exe /8f 89 19 111 26
	
	::Colors
	call colorbox.exe /44 0 0 10 0
	call colorbox.exe /ff 11 0 20 0
	call colorbox.exe /44 21 0 30 0
	call colorbox.exe /ff 31 0 40 0
	call colorbox.exe /44 41 0 50 0
	call colorbox.exe /ff 51 0 60 0
	call colorbox.exe /44 61 0 70 0
	call colorbox.exe /ff 71 0 80 0
	call colorbox.exe /44 81 0 90 0
	call colorbox.exe /ff 91 0 100 0
	call colorbox.exe /44 101 0 110 0
	call colorbox.exe /ff 111 0 119 0
	
	
	set box_market_1=2 8 19 10
	set box_market_2=2 11 19 13
	set box_market_3=2 14 19 16
	set box_market_4=2 17 19 19
	set box_market_5=22 8 39 10
	set box_market_6=22 11 39 13
	set box_market_7=22 14 39 16
	set box_market_8=42 8 69 10
	set box_market_9=42 11 69 13
	set box_market_10=42 14 69 16
	set box_market_11=72 8 109 10
	set box_market_12=72 11 109 13
	set box_market_13=72 14 109 16
	set box_market_14=90 20 110 25
	call getinput.exe /M !box_market_1! !box_market_2! !box_market_3! !box_market_4! !box_market_5! !box_market_6! !box_market_7! !box_market_8! !box_market_9! !box_market_10! !box_market_11! !box_market_12! !box_market_13! !box_market_14! /H f0
	set choice_market=!errorlevel!
	
		if !choice_market!==1 (
			
			if !user_money! geq 40 (
			set /a user_order_items_health_potion=!user_order_items_health_potion!+1
			set /a user_money=!user_money!-40
			call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_71!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
		
		)
		
		
		
		if !choice_market!==2 (

			if !user_money! geq 70 (
			set /a user_order_items_elixir=!user_order_items_elixir!+1
			set /a user_money=!user_money!-70
			call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_73!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
		
		)
		
		
		if !choice_market!==3 (
		
			if !user_money! geq 10 (
			set /a user_order_items_smoke=!user_order_items_smoke!+1
			set /a user_money=!user_money!-10
			call :change_dll_var_save user_order_items_smoke !user_order_items_smoke!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_74!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
		
		
		)
		
		
	if !choice_market!==4 (
	
			if !user_money! geq 100 (
			set /a user_order_items_speed_booster=!user_order_items_speed_booster!+1
			set /a user_money=!user_money!-100
			call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_75!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
	
	)
		
		
		
	if !choice_market!==5 (
	
		if !user_order_items_health_potion! geq 1 (
		set /a user_order_items_health_potion=!user_order_items_health_potion!-1
		set /a user_money=!user_money!+20
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_76!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_79!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	)
		
		
		
		
		
	if !choice_market!==6 (
	
		if !user_order_items_elixir! geq 1 (
		set /a user_order_items_elixir=!user_order_items_elixir!-1
		set /a user_money=!user_money!+35
		call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_77!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_79!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)	
	
	)
		
	if !choice_market!==7 (
	
		if !user_order_items_speed_booster! geq 1 (
		set /a user_order_items_speed_booster=!user_order_items_speed_booster!-1
		set /a user_money=!user_money!+50
		call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_142!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_79!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	
	)
		
		
	if !choice_market!==8 (
	
		if !user_order_items_health_potion! geq 1 (
		set /a user_order_items_health_potion=!user_order_items_health_potion!-1
		set /a user_order_items_smoke=!user_order_items_smoke!+3
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion! 
		call :change_dll_var_save user_order_items_smoke !user_order_items_smoke! 
		cls
		echo.
		echo  !text_81!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_80!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
		
	)
		
	
	if !choice_market!==9 (
	
		if !user_order_items_elixir! geq 1 (
		set /a user_order_items_elixir=!user_order_items_elixir!-1
		set /a user_order_items_smoke=!user_order_items_smoke!+3
		call :change_dll_var_save user_order_items_elixir !user_order_items_elixir! 
		call :change_dll_var_save user_order_items_smoke !user_order_items_smoke! 
		cls
		echo.
		echo  !text_82!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_80!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	)
		
		
	if !choice_market!==10 (
	
		if !user_order_items_speed_booster! geq 1 (
		set /a user_order_items_speed_booster=!user_order_items_speed_booster!-1
		set /a user_order_items_health_potion=!user_order_items_health_potion!+2
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion! 
		call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster! 
		cls
		echo.
		echo  !text_83!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_80!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	
	)
		
	if !choice_market!==11 (
	
		if !user_money! geq 150 (
		set /a user_order_health_constant=!user_order_health_constant!+50
		set /a user_money=!user_money!-150
		call :change_dll_var_save user_order_health_constant !user_order_health_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_85!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	)
	
	if !choice_market!==12 (
	
		if !user_money! geq 175 (
		set /a user_order_attack_constant=!user_order_attack_constant!+20
		set /a user_money=!user_money!-175
		call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_86!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	
	)
		
	
	
	if !choice_market!==13 (
	
		if !user_money! geq 200 (
		set /a user_order_speed_constant=!user_order_speed_constant!+10
		set /a user_money=!user_money!-200
		call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_87!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_market
		)
	
	)
		
		
		
		
	
	if !choice_market!==14 (
		cls
		goto :graphics_mainmenu
	)
	
	
	
	
	)
	
	if !user_side!==chaos (
	echo.
	echo    !text_66!                                   !text_62!
	echo.
	echo.
	echo.
	echo      !text_67!                               !text_68!
    echo      [-50]                                                                 [-150]
	echo.
	echo                                                                            !text_69!
	echo                                                                            [-175] 
	echo.
	echo                                                                            !text_70!
	echo                                                                            [-200]
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                                                                   !text_47!
	echo.
	echo.
	echo.
	call colorbox.exe /8f 71 3 110 17
	call colorbox.exe /8f 1 3 20 12
	call colorbox.exe /8f 89 19 111 26
	
	call colorbox.exe /44 0 0 10 0
	call colorbox.exe /ff 11 0 20 0
	call colorbox.exe /44 21 0 30 0
	call colorbox.exe /ff 31 0 40 0
	call colorbox.exe /44 41 0 50 0
	call colorbox.exe /ff 51 0 60 0
	call colorbox.exe /44 61 0 70 0
	call colorbox.exe /ff 71 0 80 0
	call colorbox.exe /44 81 0 90 0
	call colorbox.exe /ff 91 0 100 0
	call colorbox.exe /44 101 0 110 0
	call colorbox.exe /ff 111 0 119 0
	
	set box_market_15=2 7 19 10
	set box_market_16=72 8 109 10
	set box_market_17=72 11 109 13
	set box_market_18=72 14 109 16
	set box_market_19=90 20 110 25
	call getinput.exe /M !box_market_15! !box_market_16! !box_market_17! !box_market_18! !box_market_19! /H f0
	set choice_market_2=!errorlevel!
	
		
	if !choice_market_2!==1 (
		
			if !user_money! geq 50 (
			set /a user_chaos_items_number=!user_chaos_items_number!+1
			set /a user_money=!user_money!-50
			call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_89!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_88!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
		
	)
	
	
	
	
	
	if !choice_market_2!==2 (
		
			if !user_money! geq 150 (
			set /a user_chaos_health_constant=!user_chaos_health_constant!+50
			set /a user_money=!user_money!-150
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_85!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
		
	)
	
	
	if !choice_market_2!==3 (
	
			if !user_money! geq 175 (			
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+20
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+20
			set /a user_money=!user_money!-175	
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_90!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)
	
	)
	
	
	if !choice_market_2!==4 (
	
			if !user_money! geq 200 (			
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+10
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+10
			set /a user_money=!user_money!-200	
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_91!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_market
			)	
	
	
	
	
	
	)
	
	
	
	
	
	
	if !choice_market_2!==5 (
		cls
		goto :graphics_mainmenu
	)
	
	
	
	
	
	)

	
	cls
	goto :graphics_market
	goto :eof
	
	::[=====================================================]
	
	:console
	color 0f
	cls
	echo.
	call colorchar.exe /0b "   Chaos Against Order Console"
	echo.
	echo.
	echo    Type "help" to get information.
	echo.
	:console_prompt
	call colorchar.exe /08 " command"
	call colorchar.exe /0f "[]-"
	set /p console_command=
	
	
	
	if !console_command!==help (
		set console_command=
		echo.
		echo  Help Section
		echo.
		echo  - help                  : Prints this section.
		echo  - resetgame             : Deletes save data and resets game.
		echo  - chlang {language}     : Changes language ^| Current languages : { tur, eng }
		echo  - clear                 : Clears screen
		echo  - exit                  : Exits console.
		echo.
	
	pause
	goto :console_prompt
	)
	
	if !console_command!==clear (
		set console_command=
		cls
		goto :console
	
	)
	
	
	
	
	if !console_command!==iknowright (
		set console_command=
		set /a user_xp=!user_xp!+400
		call :change_dll_var_save user_xp !user_xp!
		echo  Added 400 XP points.
		timeout /t 3 >nul
		goto :console_prompt
	)
	
	if "!console_command!"=="chlang tur" (
		set language=tur
		call :change_dll_var_database language tur
		echo.
		echo  Changed language.
		timeout /t 3 >nul
		exit
	)
	
		if "!console_command!"=="chlang eng" (
		set language=tur
		call :change_dll_var_database language eng
		echo.
		echo  Changed language.
		timeout /t 3 >nul
		exit
	)
	
	
	
	if !console_command!==givemefuckingmoney (
		set console_command=
		set /a user_money=!user_money!+500
		call :change_dll_var_save user_money !user_money!
		echo.
		echo  Gave you fucking money...
		timeout /t 3 >nul
		goto :console_prompt
	)
	
	
	
	
	
	
	
	
	
	if !console_command!==^exit (
		cls
		goto :eof
	)
	
	
	if !console_command!==iamahoarder (
	
	
		if !user_side!==order (
		set console_command=
			set /a user_order_items_health_potion=999
			set /a user_order_items_elixir=999
			set /a user_order_items_smoke=999
			set /a user_order_items_speed_booster=999
			set /a user_order_items_speed_decreaser=999
			set /a user_order_items_mega_strike=999
			call :change_dll_var_save user_order_items_health_potion 999
			call :change_dll_var_save user_order_items_elixir 999
			call :change_dll_var_save user_order_items_smoke 999
			call :change_dll_var_save user_order_items_speed_booster 999
			call :change_dll_var_save user_order_items_speed_decreaser 999
			call :change_dll_var_save user_order_items_mega_strike 999
			echo.
			echo  Making you a hoarder...
			timeout /t 3 >nul
			goto :console_prompts
		
		)
		if !user_side!==chaos (
		set /a user_chaos_items_number=999
		call :change_dll_var_save user_chaos_items_number 999
			echo  Making you a hoarder...
			timeout /t 3 >nul
			goto :console_prompts
		)
	
	
	
	
	)
	
	
	if !console_command!==makeitrain (
	set console_command=
		echo.
		echo  Raining Money...
		set /a user_money=!user_money!+5000
		call :change_dll_var_save user_money !user_money!
		timeout /t 3 >nul
		goto :console_prompt
	)
	
	
	if !console_command!==resetgame (
		:resetgame
		echo.
		echo  Reseting the game...
		copy "!cd!\Recovery\db_recovery.cao" "!cd!"
		copy "!cd!\Recovery\s_recovery.cao" "!cd!"
		del "!cd!\database.cao"
		del "!cd!\save.cao"
		ren "!cd!\db_recovery.cao" "database.cao"
		ren "!cd!\s_recovery.cao" "save.cao"
		echo.
		echo  Completed!
		timeout /t 3 >nul
		exit
	)
	
	
	
	
	if !console_command!==makemegod (
	
		if !user_side!==order (
			set /a user_order_health_constant=9999
			call :change_dll_var_save user_order_health_constant !user_order_health_constant!
			set /a user_order_attack_constant=9999
			call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
			set /a user_order_speed_constant=9999
			call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
			echo.
			echo  Making you god...
			timeout /t 3 >nul
		
		)
		if !user_side!==chaos (
		
			set /a user_chaos_health_constant=9999
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			set /a user_chaos_attack_constant_start=9997
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			set /a user_chaos_attack_constant_end=9999
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			set /a user_chaos_speed_constant_start=9997
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			set /a user_chaos_speed_constant_end=9999
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!
			echo.
			echo  Making you god...
			timeout /t 3 >nul
			goto :console_prompt
		)
	
	)
	
	
	
	
	
	cls
	goto :console
	
	::[=====================================================]
	
	:graphics_start_alternate_1
	color 8f
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                          V
	echo.
	echo.
	echo.
	echo.
	if !first_time!==true (
	call colorchar.exe /8b "                                            Developed By: Technical_User_X"
	)else (
	call colorchar.exe /8b "                                            !text_141! Technical_User_X"
	)
	echo.
	echo                                             bytechonline.wordpress.com
	echo.
	echo                                                    Version 1.0.2
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	if !first_time!==true (
	echo   Press any key to continue...
	)else (
	echo   !text_17!
	)
	::CHAOS
	call colorbox.exe /cc 10 3 11 7
	call colorbox.exe /cc 10 3 17 3
	call colorbox.exe /cc 10 7 17 7
	
	call colorbox.exe /cc 20 3 21 7
	call colorbox.exe /cc 24 3 25 7
	call colorbox.exe /cc 20 5 25 5
	
	call colorbox.exe /cc 28 3 29 7
	call colorbox.exe /cc 32 3 33 7
	call colorbox.exe /cc 28 5 33 5
	call colorbox.exe /cc 28 3 33 3
	
	call colorbox.exe /cc 36 3 43 3
	call colorbox.exe /cc 36 7 43 7
	call colorbox.exe /cc 36 3 37 7
	call colorbox.exe /cc 43 3 44 7
	
	call colorbox.exe /cc 47 3 54 3
	call colorbox.exe /cc 47 3 48 5
	call colorbox.exe /cc 47 5 54 5
	call colorbox.exe /cc 53 5 54 7
	call colorbox.exe /cc 47 7 54 7
	
	
	::ORDER
	call colorbox.exe /33 60 3 67 3
	call colorbox.exe /33 60 3 61 7
	call colorbox.exe /33 60 7 67 7
	call colorbox.exe /33 66 3 67 7
	
	call colorbox.exe /33 69 3 76 3
	call colorbox.exe /33 69 3 70 5
	call colorbox.exe /33 69 5 76 5
	call colorbox.exe /33 69 5 70 7
	call colorbox.exe /33 75 3 76 5
	call colorbox.exe /33 72 5 73 6
	call colorbox.exe /33 74 7 76 7
	
	call colorbox.exe /33 78 3 79 7
	call colorbox.exe /33 78 3 83 3
	call colorbox.exe /33 78 7 83 7
	call colorbox.exe /33 84 4 85 6
	
	call colorbox.exe /33 87 3 94 3
	call colorbox.exe /33 87 5 94 5
	call colorbox.exe /33 87 7 94 7
	call colorbox.exe /33 87 3 88 7
	
	call colorbox.exe /33 96 3 103 3
	call colorbox.exe /33 96 3 97 7
	call colorbox.exe /33 102 3 103 5
	call colorbox.exe /33 96 5 103 5
	call colorbox.exe /33 99 6 100 6
	call colorbox.exe /33 101 7 103 7
 	call colorbox.exe /8f 8 2 105 8
	
	
	
	pause >nul
	
	goto :eof
	
	::[=====================================================]
	
	:graphics_battletower

	
	color 2f
	cls
	echo.
	call colorchar.exe /8f "  [ !text_92! ] "
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo       !text_93!
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                                                                         !text_30!
	echo.
	echo.
	echo.
	if !trader_show!==true (
	echo                                              !text_94!
	)
	echo.
	
	
	
	call colorbox.exe /88 0 0 119 29
	call colorbox.exe /87 1 0 118 29
	
	
	call colorbox.exe /aa 100 3 115 17 /DD
	call colorbox.exe /aa 88 5 110 14 /DD
	call colorbox.exe /aa 2 20 20 28 /DD
	call colorbox.exe /aa 5 23 25 28 /DD
	call colorbox.exe /aa 2 17 15 22 /DD
	call colorbox.exe /aa 20 4 40 8 /DD
	call colorbox.exe /aa 23 5 50 9 /DD
	call colorbox.exe /99 25 5 38 7 /DD
	call colorbox.exe /99 22 5 38 6 /DD
	
	::YOUR BASE
	call colorbox.exe /88 92 9 100 12 /DD
	call colorbox.exe /bb 98 12 99 12 /DD
	call colorbox.exe /bb 93 10 94 11 /DD
	
	
	::FLAG POST
	call colorbox.exe /88 90 6 91 7
	
	if !user_side!==order (
	call colorbox.exe /99 91 6 92 6
	)
	if !user_side!==chaos (
	call colorbox.exe /cc 91 6 92 6
	)
	
	
	::YOUR Market
	call colorbox.exe /88 98 5 103 7 /DD
	
	call colorbox.exe /44 98 5 99 5
	call colorbox.exe /ff 99 5 100 5
	call colorbox.exe /44 100 5 101 5
	call colorbox.exe /ff 101 5 102 5
	call colorbox.exe /44 102 5 103 5
	call colorbox.exe /bb 101 7 102 7
	
	::YOUR BATTLE TOWER
	call colorbox.exe /88 102 14 109 16 /DD
	call colorbox.exe /88 103 12 107 15 /DD
	call colorbox.exe /bb 104 13 106 13 /DD
	call colorbox.exe /bb 105 16 106 16 /DD
	call colorbox.exe /22 106 14 107 14 /DD
	call colorbox.exe /ff 107 14 108 14 /DD
	call colorbox.exe /88 108 14 109 14 /DD
	
	
	if !trader_show!==true (
	
	call colorbox.exe /aa 60 20 80 26 /DD
	call colorbox.exe /77 66 22 76 25 /DD
	call colorbox.exe /66 66 22 67 22 /DD
	call colorbox.exe /ff 67 22 68 22 /DD
	call colorbox.exe /66 68 22 69 22 /DD
	call colorbox.exe /ff 69 22 70 22 /DD
	call colorbox.exe /66 70 22 71 22 /DD
	call colorbox.exe /ff 71 22 72 22 /DD
	call colorbox.exe /66 72 22 73 22 /DD
	call colorbox.exe /ff 73 22 74 22 /DD
	call colorbox.exe /66 74 22 75 22 /DD
	call colorbox.exe /ff 75 22 76 22 /DD
	call colorbox.exe /bb 71 25 72 25 /DD
	call colorbox.exe /bb 68 23 74 23 /DD
	)
	
	
	
	
	::RIVAL BASE
	call colorbox.exe /88 5 22 14 25 /DD
	call colorbox.exe /bb 7 25 8 25 /DD
	
	::RIVAL FLAG POST
	call colorbox.exe /88 16 21 17 23
	if !enemy_side!==order (
	call colorbox.exe /99 17 21 18 21
	)
	if !enemy_side!==chaos (
		call colorbox.exe /cc 17 21 18 21
	)
	
	::White Button Colorboxes
	call colorbox.exe /2f 101 18 113 22
	call colorbox.exe /2f 3 12 14 16
	
	set box_battletower_1=102 19 112 21
	set box_battletower_2=4 13 13 15
	set box_battletower_3=41 23 56 25
	
	if !trader_show!==false (
	call getinput.exe /M  !box_battletower_1!  !box_battletower_2! /H f0
	set choice_battletower=!errorlevel!
	
	
		if !choice_battletower!==1 (
			cls
			goto :graphics_mainmenu
		)
		
		if !choice_battletower!==2 (
			call :battle_calculator
			cls
			goto :graphics_battle_scene
		)
		
		
		
		
		
	)
	
	
	if !trader_show!==true (
	
		call colorbox.exe /2f 40 22 57 26
		call getinput.exe /M  !box_battletower_1!  !box_battletower_2! !box_battletower_3! /H f0
	set choice_battletower=!errorlevel!
			
		if !choice_battletower!==1 (
			cls
			goto :graphics_mainmenu
		)
		
		if !choice_battletower!==2 (
			call :battle_calculator
			cls
			goto :graphics_battle_scene
		)
		
		if !choice_battletower!==3 (
		cls
		goto :graphics_magic_market
		
		)
		
		
	)
	
	
	
	
	
	
	
	cls
	goto :graphics_battletower
	goto :eof
	
	::[=====================================================]
	
	:graphics_battle_scene
	cls
	color 8f
	call colorbox.exe /77 0 0 119 0
	call colorbox.exe /77 0 1 119 1
	echo.
	call colorchar.exe /77 " "
	call colorchar.exe /8f " !text_31! : "
	
	call colorchar.exe /88 " "
	
	
	if !user_side!==order (
		call colorchar.exe /8a "!user_order_health_current! "
		call colorchar.exe /77 " "
		call colorchar.exe /8f " !text_33! : "
		call colorchar.exe /8e "!user_order_speed_current! "
		
		call colorchar.exe /77 "                              "
		
		call colorchar.exe /8f " !text_98! : "
		call colorchar.exe /8a " !enemy_chaos_health_current! "
		call colorchar.exe /77 " "
		call colorchar.exe /8f " !text_99! : "
		call colorchar.exe /8e " !enemy_chaos_speed_current_start! - !enemy_chaos_speed_current_end! "
	)
	
	if !user_side!==chaos (
		call colorchar.exe /8a " !user_chaos_health_current! "
		call colorchar.exe /77 " "
		call colorchar.exe /8f " !text_33! : "
		call colorchar.exe /8e " !user_chaos_speed_current_start! - !user_chaos_speed_current_end! "
	
		call colorchar.exe /77 "                              "

		call colorchar.exe /8f " !text_98! : "
		call colorchar.exe /8a " !enemy_order_health_current! "
		call colorchar.exe /77 " "
		call colorchar.exe /8f " !text_99! : "
		call colorchar.exe /8e " !enemy_order_speed_current! "
	)
	
	

	
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo      !text_95!!text_96!!text_97!!text_118!
	echo.
	echo.
	
	
	::Environment
	call colorbox.exe /33 0 2 119 8 /DD
	call colorbox.exe /22 0 9 119 9 /DD
	call colorbox.exe /aa 0 10 119 12 /DD
	call colorbox.exe /77 0 13 119 13 /DD
	call colorbox.exe /77 0 17 119 17 /DD
	
	::Button Edges
	call colorbox.exe /77 0 13 15 17
	call colorbox.exe /77 15 13 30 17
	call colorbox.exe /77 30 13 45 17
	call colorbox.exe /77 45 13 60 17
	
	
	::Character_1
	call colorbox.exe /0F 10 6 14 7 /DD
	call colorbox.exe /0f 11 8 13 9 /DD
	call colorbox.exe /0f 13 10 14 11 /DD
	call colorbox.exe /0f 10 10 11 11 /DD
	call colorbox.exe /0f 9 8 11 8 /DD
	call colorbox.exe /0f 8 8 9 9 /DD
	call colorbox.exe /0f 13 8 19 8 /DD

	::Character_2
	call colorbox.exe /0F 90 6 94 7 /DD
	call colorbox.exe /0f 91 8 93 9 /DD
	call colorbox.exe /0f 93 10 94 11 /DD
	call colorbox.exe /0f 90 10 91 11 /DD
	call colorbox.exe /0f 94 8 96 8 /DD
	call colorbox.exe /0f 95 8 96 9 /DD
	call colorbox.exe /0f 86 8 94 8 /DD
	
	if !user_side!==order (
	call colorbox.exe /11 8 8 9 8
	call colorbox.exe /cc 95 8 96 8 /DD
	)
	if !user_side!==chaos (
	call colorbox.exe /cc 8 8 9 8
	call colorbox.exe /11 95 8 96 8 /DD
	
	)
	
	::Buttons
	set box_battle_scene_1=1 14 14 16
	set box_battle_scene_2=16 14 29 16
	set box_battle_scene_3=31 14 44 16
	set box_battle_scene_4=46 14 59 16
	
	if !skip_battle_scene_choice!==true (
	set skip_battle_scene_choice=false
	goto :skip_1
	)
	
	call getinput.exe /M !box_battle_scene_1! !box_battle_scene_2! !box_battle_scene_3! !box_battle_scene_4! /H f0
	
	set choice_battle_scene=!errorlevel!
	

	if !choice_battle_scene!==4 (
	cls
	set choice_battle_scene=
	goto :graphics_battle_scene
	
	)
	
	
	if !choice_battle_scene!==2 (
	
		if !user_side!==order (
		call :select_item_order
		)
		if !user_side!==chaos (
		call :select_item_chaos
		)
	
	
	)
	
	if !choice_battle_scene!==3 (
		
		if !user_side!==order (
			call :runaway_order
		)
		if !user_side!==chaos (
			call :runaway_chaos
		)
		
	)
	
	
	
	
	
	:skip_1
	

	
	
	call :move_calculator
	
	cls
	goto :graphics_battle_scene
	goto :eof
	
	::[=====================================================]
	
	:battle_calculator
	
	if !user_side!==order (
		
		set user_order_health_current=!user_order_health_constant!
		set user_order_attack_current=!user_order_attack_constant!
		set user_order_speed_current=!user_order_speed_constant!
		

		set enemy_chaos_health_current=!enemy_chaos_health_constant!
		set enemy_chaos_attack_current_start=!enemy_chaos_attack_constant_start!
		set enemy_chaos_attack_current_end=!enemy_chaos_attack_constant_end!
		set enemy_chaos_speed_current_start=!enemy_chaos_speed_constant_start!
		set enemy_chaos_speed_current_end=!enemy_chaos_speed_constant_end!
	
	
	
	
	
	
	)
	
	if !user_side!==chaos (
	
		set user_chaos_health_current=!user_chaos_health_constant!
		set user_chaos_attack_current_start=!user_chaos_attack_constant_start!
		set user_chaos_attack_current_end=!user_chaos_attack_constant_end!
		set user_chaos_speed_current_start=!user_chaos_speed_constant_start!
		set user_chaos_speed_current_end=!user_chaos_speed_constant_end!
	
	
		set enemy_order_health_current=!enemy_order_health_constant!
		set enemy_order_attack_current=!enemy_order_attack_constant!
		set enemy_order_speed_current=!enemy_order_speed_constant!
	
	
	)
	
	
	
	goto :eof
	
	::[=====================================================]
	
	:move_calculator
	
		call :speed_analysis

	
		if !move_priority!==user (
		call :user_move
		call :battle_result_calculator
		call :enemy_move
		call :battle_result_calculator
		
		
		)
		if !move_priority!==enemy (
		call :enemy_move
		call :battle_result_calculator
		call :user_move
		call :battle_result_calculator
		
		
		)
	
	
	goto :eof
	
	::[=====================================================]
	
	:reset_random
		for /l %%a in ( 1,1,100) do (
		set junk=!random!
		)
	goto :eof
	
	::[=====================================================]
	
	:possibility_calculator
		call :reset_random
		set possible=false
		
		set divide=!random!
		set /a possibility=(!divide! %% 100) + 1
		
		if !possibility! leq %~1 (
		set possible=true
		)
	
	goto :eof
	
	::[=====================================================]
	
		
	:TESTING
	color 0f
	call :speed_analysis
	echo  User !user_final_speed!
	echo  Enemy !enemy_final_speed!
	echo.
	echo  Priority !move_priority!
	
	
	pause
	exit
	goto :eof
	
	::[=====================================================]
	
	:speed_analysis
		
		call :reset_random
		set enemy_final_speed=
		set user_final_speed=
		set move_priority=
		
		if !user_side!==order (
		
		set modulus=


		
		set /a divide= !enemy_chaos_speed_current_end! - !enemy_chaos_speed_current_start! 
		set /a modulus =   !random! %% !divide!
		set /a modulus = !modulus! + !enemy_chaos_speed_current_start! + 1
		
		set enemy_final_speed=!modulus!
		set user_final_speed=!user_order_speed_current!
		
			if !user_final_speed! geq !enemy_final_speed! (
			
			set move_priority=user
			)else (
			set move_priority=enemy
			)
		
		
		)
	
	
		if !user_side!==chaos (
		
			set modulus=


		
		set /a divide= !user_chaos_speed_current_end! - !user_chaos_speed_current_start! 
		set /a modulus =   !random! %% !divide!
		set /a modulus = !modulus! + !user_chaos_speed_current_start! + 1
		
		set enemy_final_speed=!enemy_order_speed_current!
		set user_final_speed=!modulus!
		
			if !user_final_speed! geq !enemy_final_speed! (
			
			set move_priority=user
			)else (
			set move_priority=enemy
		
		)
		
	)
	
	
	
	goto :eof
	
	::[=====================================================]
	
	:user_move
	
		if !choice_battle_scene!==1 (
			set choice_battle_scene=
			set skip_battle_scene_choice=
			
			if !user_side!==order (
			call :user_order_move_attack
			)
		
			if !user_side!==chaos (
			
			call :user_chaos_move_attack
			)
		
		
		)
	
	
	
	
	
		if !gonna_use_item!==true (	
			call :use_item	
		)
	
	
	
	

	
	
	
	
	
	
	goto :eof
	
	::[=====================================================]
	
	:enemy_move
	
		if !enemy_side!==order (
			call :enemy_order_move_general
		)
		
		if !enemy_side!==chaos (
			call :enemy_chaos_move_general
		)
	
	
	
	goto :eof
	
	::[=====================================================]
	::[===============================================================================]
	
	:battle_result_calculator
		timeout /t 2 >Nul
		if !user_side!==order (
		
			if !user_order_health_current! leq 0 (
			goto :graphics_loose
			)
			if !enemy_chaos_health_current! leq 0 (
			goto :graphics_win
			)
		
		
		)
		
		if !user_side!==chaos (
		
			if !user_chaos_health_current! leq 0 (
			goto :graphics_loose
			)
			if !enemy_order_health_current! leq 0 (
			goto :graphics_win
			)
		
		)
	
	
	
	
	
	
	
	
	

	
	goto :eof
	
	::[===============================================================================]
	::[=====================================================]
	

	
	:user_order_move_attack
	
	call colorchar.exe /88 " "
	call colorchar.exe /!user_color!  " !username! !text_103! :"
	call colorchar.exe /88 " "
	
		call :possibility_calculator 10
		call :attack_analysis
			
			if !possible!==true (
			
			
				if !mega_strike!==true (
					set mega_strike=false
					call :critical_mega_normal user_final_attack !user_final_attack!
					echo  !text_101! + !text_102! + Normal !text_104!  !user_final_attack!
					set /a enemy_chaos_health_current=!enemy_chaos_health_current!-!user_final_attack!
					timeout /t 2 >nul
						goto :eof
				)
				if !mega_strike!==false (
					
					call :critical_normal user_final_attack !user_final_attack!
					echo  !text_101! + Normal !text_104! !user_final_attack!
					set /a enemy_chaos_health_current=!enemy_chaos_health_current!-!user_final_attack!
					timeout /t 2 >nul
						goto :eof
				)
			
			
			)
			if !possible!==false (
			
				if !mega_strike!==true (
					set mega_strike=false
					call :mega_normal user_final_attack !user_final_attack!
					echo  !text_102! + Normal !text_104! !user_final_attack! 
					set /a enemy_chaos_health_current=!enemy_chaos_health_current!-!user_final_attack!
					timeout /t 2 >nul
						goto :eof
				)
				if !mega_strike!==false (
					echo  Normal !text_104! !user_final_attack!
					set /a enemy_chaos_health_current=!enemy_chaos_health_current!-!user_final_attack!
					timeout /t 2 >nul
						goto :eof
				)
			
			
			
			)
	
		timeout /t 2 >nul

	goto :eof
	
	::[===============================================================================]
	
	:user_chaos_move_attack
	
	call colorchar.exe /88 " "
	call colorchar.exe /!user_color!  " !username! !text_103! :"
	call colorchar.exe /88 " "
	
		call :possibility_calculator 10
		call :attack_analysis
			if !possible!==true (
			
			
				if !mega_strike!==true (
					set mega_strike=false
					call :critical_mega_normal user_final_attack !user_final_attack!
					echo  !text_101! + !text_102! + Normal !text_104! !user_final_attack!
					set /a enemy_order_health_current=!enemy_order_health_current!-!user_final_attack!
						timeout /t 2 >nul
						goto :eof
				)
				if !mega_strike!==false (
					
					call :critical_normal user_final_attack !user_final_attack!
					echo  !text_101! + Normal !text_104! !user_final_attack!
					set /a enemy_order_health_current=!enemy_order_health_current!-!user_final_attack!
						timeout /t 2 >nul
						goto :eof
				)
			
			
			)
			if !possible!==false (
			
				if !mega_strike!==true (
					set mega_strike=false
					call :mega_normal user_final_attack !user_final_attack!
					echo  !text_102! + Normal !text_104! !user_final_attack!
					set /a enemy_order_health_current=!enemy_order_health_current!-!user_final_attack!
						timeout /t 2 >nul
						goto :eof
				)
				if !mega_strike!==false (
					echo  Normal !text_104! !user_final_attack!
					set /a enemy_order_health_current=!enemy_order_health_current!-!user_final_attack!
					 	timeout /t 2 >nul
						goto :eof
				)
			
			
			
			)
	





	timeout /t 2 >nul
	goto :eof
	
	::[===============================================================================]
	
	:enemy_order_move_general
	set enemy_use_mega_strike=false
	
	call :attack_analysis
	call colorchar.exe /88 " "
	call colorchar.exe /!enemy_color! " !text_105! !text_106! :"
	call colorchar.exe /88 " "
		call :possibility_calculator 80
		
		
		if !possible!==true (

			call :possibility_calculator 5
			if !possible!==true (
			set enemy_use_mega_strike=true
			)
		

			call :possibility_calculator 5	
			if !possible!==true (
				
				if !enemy_use_mega_strike!==true (
					call :critical_mega_normal enemy_final_attack !enemy_final_attack!
					echo  !text_101! + !text_102! + Normal !text_104! !enemy_final_attack!
					set /a user_chaos_health_current=!user_chaos_health_current!-!enemy_final_attack!
					goto :eof
				)else (
					call :critical_normal enemy_final_attack !enemy_final_attack!
					echo !text_101! + Normal !text_104! !enemy_final_attack!
					set /a user_chaos_health_current=!user_chaos_health_current!-!enemy_final_attack!
					goto :eof
				)
			
			
			)else (
			
				if !enemy_use_mega_strike!==true (
					call :mega_normal enemy_final_attack !enemy_final_attack!
					echo  !text_102! + Normal !text_104! !enemy_final_attack!
					set /a user_chaos_health_current=!user_chaos_health_current!-!enemy_final_attack!
					goto :eof
				)else (
					echo  Normal !text_104! !enemy_final_attack!
					set /a user_chaos_health_current=!user_chaos_health_current!-!enemy_final_attack!
					goto :eof
				)	
			)
		)
	
	
		call :possibility_calculator 50
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_38!
		
		set /a enemy_order_health_current=!enemy_order_health_current!+100*!user_level!
		
		timeout /t 3 >nul
		goto :eof
		
		)
	
		call :possibility_calculator 40
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_39!
		
		set /a enemy_order_attack_current=!enemy_order_attack_current!+30*!user_level!
		
		timeout /t 3 >nul
		goto :eof
		)
	
		call :possibility_calculator 20
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_41!
		
		set /a enemy_order_speed_current=!enemy_order_speed_current!+10*!user_level!
		
		timeout /t 3 >nul
		goto :eof
		)
	
		call :possibility_calculator 10
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_42!
		
					if !user_chaos_speed_current_start!==0 (
			echo  !text_116!
			goto :eof
			)
			
			set /a user_chaos_speed_current_start=!user_chaos_speed_current_start!-20*!user_level!
			set /a user_chaos_speed_current_end=!user_chaos_speed_current_start!-20*!user_level!
		
		
			if !user_order_speed_current! leq 0 (
				set /a user_order_speed_current=0
			)
		
		
		
		
		
		
		
		timeout /t 3 >nul
		goto :eof
		)	
	
	
	
	
	
	
	
	
	
	
	
	
		timeout /t 2 >nul

	goto :enemy_order_move_general
	
	::[===============================================================================]
	
	:enemy_chaos_move_general
	set enemy_use_mega_strike=false
	
	call :attack_analysis
	call colorchar.exe /88 " "
	call colorchar.exe /!enemy_color! " !text_105! !text_106! :"
	call colorchar.exe /88 " "
	
	
	
		call :possibility_calculator 80
		if !possible!==true (
		
		
		
			call :possibility_calculator 5
			if !possible!==true (
			set enemy_use_mega_strike=true
			)
		
		
		
		
			call :possibility_calculator 5	
			if !possible!==true (
			
				if !enemy_use_mega_strike!==true (
					call :critical_mega_normal enemy_final_attack !enemy_final_attack!
					echo  !text_101! + !text_102! + Normal !text_104! !enemy_final_attack!
					set /a user_order_health_current=!user_order_health_current!-!enemy_final_attack!
					goto :eof
				)else (
					call :critical_normal enemy_final_attack !enemy_final_attack!
					echo  !text_101! + Normal !text_104! !enemy_final_attack!
					set /a user_order_health_current=!user_order_health_current!-!enemy_final_attack!
					goto :eof
				)
			
			)else (
			
				if !enemy_use_mega_strike!==true (
					call :mega_normal enemy_final_attack !enemy_final_attack!
					echo  !text_102! + Normal !text_104! !enemy_final_attack!
					set /a user_order_health_current=!user_order_health_current!-!enemy_final_attack!
					goto :eof
				)else (
					echo  Normal !text_104! !enemy_final_attack!
					set /a user_order_health_current=!user_order_health_current!-!enemy_final_attack!
					goto :eof
				)
			)
		)
	
	
		call :possibility_calculator 50
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_38!
		
		set /a enemy_chaos_health_current=!enemy_chaos_health_current!+100*!user_level!
		
		timeout /t 3 >nul
		goto :eof
		
		)
	
		call :possibility_calculator 40
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " " 
		echo !text_39!
		
		set /a enemy_chaos_attack_current_start=!enemy_chaos_attack_current_start!+30*!user_level!
		set /a enemy_chaos_attack_current_end=!enemy_chaos_attack_current_end!+30*!user_level!
		
		timeout /t 3 >nul
		goto :eof
		)
	
		call :possibility_calculator 20
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
		echo !text_41!
		
		set /a enemy_chaos_speed_current_start=!enemy_chaos_speed_current_start!+10*!user_level!
		set /a enemy_chaos_speed_current_end=!enemy_chaos_speed_current_end!+10*!user_level!
		
		
		timeout /t 3 >nul
		goto :eof
		)
	
		call :possibility_calculator 10
		if !possible!==true (
			call colorchar.exe /88 " "
			call colorchar.exe /!enemy_color! " !text_105! !text_111! :" 
			call colorchar.exe /88 " "
			echo !text_42!
			
			if !user_order_speed_current!==0 (
			echo  !text_116!
			goto :eof
			)
			
			set /a user_order_speed_current=!user_order_speed_current!-20*!user_level!
		
		
			if !user_order_speed_current! leq 0 (
				set /a user_order_speed_current=0
			)
		
		
		
		
		
		timeout /t 3 >nul
		goto :eof
		)	
	
	
	
	
		timeout /t 2 >nul

	goto :enemy_chaos_move_general
	
	
	::[===============================================================================]
	::[===============================================================================]
	
		:attack_analysis
		
		call :reset_random
		set enemy_final_attack=
		set user_final_attack=
		
		if !user_side!==order (
		
		set modulus=
		set divide=

		
		set /a divide= !enemy_chaos_attack_current_end! - !enemy_chaos_attack_current_start! 
		set /a modulus =   !random! %% !divide!
		set /a modulus = !modulus! + !enemy_chaos_attack_current_start! + 1
		
		set enemy_final_attack=!modulus!
		set user_final_attack=!user_order_attack_current!
		

		
		
		)
	
	
		if !user_side!==chaos (
		
			set modulus=
			set divide=

		
		set /a divide= !user_chaos_attack_current_end! - !user_chaos_attack_current_start! 
		set /a modulus =   !random! %% !divide!
		set /a modulus = !modulus! + !user_chaos_attack_current_start! + 1
		
		set enemy_final_attack=!enemy_order_attack_current!
		set user_final_attack=!modulus!
		

		
	)
	
	
	
	goto :eof
	
	::[=====================================================]
	::[=====================================================]
	::[=====================================================]
	
	::hit_calculators
	
	:critical_mega_normal
	set /a %1=(%2 * 5) * 2 
	goto :eof
	
	:critical_normal
	set /a %1=%2 * 2 
	goto :eof
	
	:mega_normal
	set /a %1=%2 * 5
	goto :eof

	

	
	::[===============================================================================]
	::[===============================================================================]
	
	:select_item_order
	set choice_select_item=
	echo  !text_107!
	echo.
	echo    !text_38! (!user_order_items_health_potion!)
	echo    !text_39! (!user_order_items_elixir!)
	echo    !text_41! (!user_order_items_speed_booster!)
	echo    !text_42! (!user_order_items_speed_decreaser!)
	echo    !text_43! (!user_order_items_mega_strike!)
	echo.
	echo    !text_108!
	echo.
	set box_item_select_1=3 20 24 20
	set box_item_select_2=3 21 24 21
	set box_item_select_3=3 22 24 22
	set box_item_select_4=3 23 24 23
	set box_item_select_5=3 24 24 24
	set box_item_select_6=3 26 24 26
	call getinput.exe /M !box_item_select_1! !box_item_select_2! !box_item_select_3! !box_item_select_4! !box_item_select_5! !box_item_select_6! /H f0
	set choice_item_select=!errorlevel!
	
	if !choice_item_select!==1 (
	
		if !user_order_items_health_potion!==0 (
		call colorchar.exe /8e " !text_110! "
		timeout /t 3 >nul
		cls
		goto :graphics_battle_scene
		)
	
	set skip_battle_scene_choice=true
	set item_use_number=1
	set gonna_use_item=true
	cls
	goto :graphics_battle_scene
	)
	
	if !choice_item_select!==2 (
	
		if !user_order_items_elixir!==0 (
		call colorchar.exe /8e " !text_110! "
		timeout /t 3 >nul
		cls
		goto :graphics_battle_scene
		)
	
	set skip_battle_scene_choice=true
	set item_use_number=2
	set gonna_use_item=true
	cls
	goto :graphics_battle_scene
	)
	
	if !choice_item_select!==3 (
	
		if !user_order_items_speed_booster!==0 (
		call colorchar.exe /8e " !text_110! "
		timeout /t 3 >nul
		cls
		goto :graphics_battle_scene
		)
	
	set skip_battle_scene_choice=true
	set item_use_number=3
	set gonna_use_item=true
	cls
	goto :graphics_battle_scene
	)	
	
	if !choice_item_select!==4 (
	
		if !user_order_items_speed_decreaser!==0 (
		call colorchar.exe /8e " !text_110! "
		timeout /t 3 >nul
		cls
		goto :graphics_battle_scene
		)

	set skip_battle_scene_choice=true
	set item_use_number=4
	set gonna_use_item=true
	cls
	goto :graphics_battle_scene
	)	
	
	
	
	if !choice_item_select!==5 (
	
		if !user_order_items_mega_strike!==0 (
		call colorchar.exe /8e " !text_110! "
		timeout /t 3 >nul
		cls
		goto :graphics_battle_scene
		)
	
	set skip_battle_scene_choice=true
	set item_use_number=5
	set gonna_use_item=true
	cls
	goto :graphics_battle_scene
	)	
	
	
	
	
	
	if !choice_item_select!==6 (
	cls
	set choice_item_select=
	goto :graphics_battle_scene
	)
	
	
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	
	:select_item_chaos
	set choice_select_item=
	echo  !text_107!
	echo.
	echo    !text_109! (!user_chaos_items_number!)
	echo.
	echo.
	echo    !text_108!
	echo.
	set box_item_select_7=3 20 24 20
	set box_item_select_8=3 23 24 23
	call getinput.exe /M !box_item_select_7! !box_item_select_8! /H f0
	set choice_item_select=!errorlevel!
	
	
	
	if !choice_item_select!==1 (
	set skip_battle_scene_choice=true
	set gonna_use_item=true
	set item_use_number=1
	cls
	set choice_item_select=
	goto :graphics_battle_scene
	
	)
	
	
	
	
	if !choice_item_select!==2 (
	cls
	set choice_item_select=
	goto :graphics_battle_scene
	)
	
	
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	
	:use_item
	
	if !user_side!==order (
	set skip_battle_scene_choice=false
	set gonna_use_item=false
	
	
		if !item_use_number!==1 (
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		echo !text_38!
		call :use_health_potion
		
		timeout /t 2 >nul
		set item_use_number=
		goto :eof
		)
		if !item_use_number!==2 (
		
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		echo !text_39!
		call :use_elixir
		
		timeout /t 2 >nul
		set item_use_number=
		goto :eof
		)
		
		if !item_use_number!==3 (
		
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		echo !text_41!
		call :use_speed_booster
		
		timeout /t 2 >nul
		set item_use_number=
		goto :eof
		)
		
		if !item_use_number!==4 (
		
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		echo !text_42!
		call :use_speed_decreaser
		
		timeout /t 2 >nul
		set item_use_number=
		goto :eof
		)
		
		if !item_use_number!==5 (
		
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		echo !text_43!
		call :use_mega_strike
		
		timeout /t 2 >nul
		set item_use_number=
		goto :eof
		)
	
	
	)
	
	if !user_side!==chaos (
	set skip_battle_scene_choice=false
	set gonna_use_item=false
	
		if !item_use_number!==1 (
		
		call colorchar.exe /88 " "
		call colorchar.exe /!user_color! " !username! !text_111! :" 
		call colorchar.exe /88 " "
		
			
			
			call :possibility_calculator 60
			if !possible!==true (
			echo !text_38!
			call :use_health_potion
			timeout /t 2 >nul
			set item_use_number=
			goto :eof
			)
		
			call :possibility_calculator 50
			if !possible!==true (
			echo !text_39!
			call :use_elixir
			timeout /t 2 >nul
			set item_use_number=
			goto :eof
			)
		
			call :possibility_calculator 50
			if !possible!==true (
			echo !text_41!
			call :use_speed_booster
			timeout /t 2 >nul
			set item_use_number=
			goto :eof
			)
			
			call :possibility_calculator 20
			if !possible!==true (
			echo !text_42!
			call :use_speed_decreaser
			timeout /t 2 >nul
			set item_use_number=
			goto :eof
			)
			
			
			
			call colorchar.exe /8e " !text_114! "
			timeout /t 2 >nul
			set item_use_number=
			goto :eof
			
		)
	
	
	)
	
	
	
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	
	:runaway_order
	set choice_runaway_select=
	
	echo  !text_112!
	echo.
	echo    !text_40! (!user_order_items_smoke!)
	echo.
	echo.
	echo    !text_108!
	echo.
	set box_item_select_7=3 20 24 20
	set box_item_select_8=3 23 24 23
	call getinput.exe /M !box_item_select_7! !box_item_select_8! /H f0
	set choice_runaway_select=!errorlevel!
	
	
	
	if !choice_runaway_select!==1 (

		if !user_order_items_smoke!==0 (
			call colorchar.exe /8e " !text_110! "
			timeout /t 3 >nul
			cls
			goto :graphics_battle_scene
		)


		set choice_runaway_select=
		cls
		color 8f
		echo.
		call colorchar /88 " "
		call colorchar /f0 "!text_119! "
		set /a user_order_items_smoke=!user_order_items_smoke!-1
		call :change_dll_var_save user_order_items_smoke !user_order_items_smoke!
		timeout /t 3 >nul
		cls
		goto :graphics_mainmenu


	)



	if !choice_runaway_select!==2 (
	cls
	set choice_runaway_select=
	goto :graphics_battle_scene
	)
	
	
	goto :eof
	
	::[===============================================================================]
	
	:runaway_chaos
	set choice_runaway_select=
	
	echo  !text_112!
	echo.
	echo    !text_113! ( 70/100 !text_115! )
	echo.
	echo.
	echo    !text_108!
	echo.
	set box_item_select_7=3 20 30 20
	set box_item_select_8=3 23 24 23
	call getinput.exe /M !box_item_select_7! !box_item_select_8! /H f0
	set choice_runaway_select=!errorlevel!
	
	if !choice_runaway_select!==1 (

		set choice_runaway_select=

		call :possibility_calculator 70
		
		if !possible!==true (
			cls
			color 8f
			echo.
			call colorchar.exe /88 " "
			call colorchar.exe /f0 "!text_119! "
			set /a user_chaos_items_number=!user_chaos_items_number!-1
			call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
			timeout /t 3 >nul
			cls
			goto :graphics_mainmenu
		
		)
		if !possible!==false (
			call colorchar.exe /8e " !text_114! "
			timeout /t 3 >nul
			cls
			set choice_battle_scene=
			set skip_battle_scene_choice=true
			goto :graphics_battle_scene
		
		)
		
	


	)



	if !choice_runaway_select!==2 (
	cls
	set choice_runaway_select=
	goto :graphics_battle_scene
	)
	
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	
	::ITEM USAGES
	
	:use_health_potion
	

	if !user_side!==order (
		set /a user_order_health_current=!user_order_health_current!+100*!user_level!
		set /a user_order_items_health_potion=!user_order_items_health_potion!-1
	)

	if !user_side!==chaos (
		set /a user_chaos_health_current=!user_chaos_health_current!+100*!user_level!
		set /a user_chaos_items_number=!user_chaos_items_number!-1
	)
	
	
	goto :eof
	
	::[===============================================================================]
	
	:use_elixir
	
	if !user_side!==order (
		set /a user_order_attack_current=!user_order_attack_current!+30*!user_level!
		set /a user_order_items_elixir=!user_order_items_elixir!-1
	)

	if !user_side!==chaos (
	
		set /a user_chaos_attack_current_start=!user_chaos_attack_current_start!+30*!user_level!
		set /a user_chaos_attack_current_end=!user_chaos_attack_current_end!+30*!user_level!
		set /a user_chaos_items_number=!user_chaos_items_number!-1
	)
	
	
	
	goto :eof
	
	::[===============================================================================]
	
	:use_speed_booster
	
	if !user_side!==order (
		set /a user_order_items_speed_booster=!user_order_items_speed_booster!-1
		set /a user_order_speed_current=!user_order_speed_current!+10*!user_level!
		
	)

	if !user_side!==chaos (
	set /a user_chaos_items_number=!user_chaos_items_number!-1
		set /a user_chaos_speed_current_start=!user_chaos_speed_current_start!+10*!user_level!
		set /a user_chaos_speed_current_end=!user_chaos_speed_current_end!+10*!user_level!
	)
	
	
	goto :eof
	
	::[===============================================================================]
	
	:use_speed_decreaser
	
	if !enemy_side!==order (
		
		if !enemy_order_speed_current!==0 (
			echo  !text_116!
			goto :eof
		)
		
		set /a user_chaos_items_number=!user_chaos_items_number!-1
		set /a enemy_order_speed_current=!enemy_order_speed_current!-20*!user_level!
		
		if !enemy_order_speed_current! leq 0 (
			set enemy_order_speed_current=0
		)
		
		
	)
	
	
	if !enemy_side!==chaos (
		
		if !enemy_chaos_speed_current_start!==0 (
			echo  !text_116!
			goto :eof
		)
	
		set /a user_order_items_speed_decreaser=!user_order_items_speed_decreaser!-1
		set /a enemy_chaos_speed_current_start=!enemy_chaos_speed_current_start!-20*!user_level!
		set /a enemy_chaos_speed_current_end=!enemy_chaos_speed_current_end!-20*!user_level!
		
		if !enemy_chaos_speed_current_start! leq 0 (
			set enemy_chaos_speed_current_start=0
		)
		
		
	)
	
	
	
	
	
	goto :eof
	

	::[===============================================================================]
	
	:use_mega_strike
		
		set mega_strike=true
		echo  !text_117!
		timeout /t 3 >nul
		set /a user_order_items_mega_strike=!user_order_items_mega_strike!-1
		goto :graphics_battle_scene
	
	
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	::[===============================================================================]
	
	:graphics_win
	cls
	set minus=
	color af
	set /a win_streak=!win_streak!+1
		if !win_streak! geq 10 (
		set win_streak=10
		)
	
	set /a loose_streak=0
	call :change_dll_var_save win_streak !win_streak!
	call :change_dll_var_save loose_streak !loose_streak!
	
	set /a minus=4 * !win_streak! * !win_streak! * !user_level!
	set /a enemy_team_number=!enemy_team_number! - !minus!
	
		if !enemy_team_number! leq 0 (
		cls
		goto :win_the_game
		)
	
	call :change_dll_var_save enemy_team_number !enemy_team_number!
	set /a xp_add= 5 * !win_streak! * !win_streak!
	set /a user_xp=!user_xp! + !xp_add! 
	set /a money_add= 3 * !win_streak! * !win_streak! * !user_level! / 2
	set /a user_money=!user_money! + !money_add!
	
	
	::Settings variables
	if !user_side!==order (
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
		call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
		call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
		call :change_dll_var_save user_order_items_speed_decreaser !user_order_items_speed_decreaser!
		call :change_dll_var_save user_order_items_mega_strike !user_order_items_mega_strike!
		call :change_dll_var_save user_xp !user_xp!
		call :change_dll_var_save user_money !user_money!
	)
	
	
	if !user_side!==chaos (
		call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
		call :change_dll_var_save user_xp !user_xp!
		call :change_dll_var_save user_money !user_money!
	
	)






	
	
	echo.
	call colorchar.exe /aa " "
	call colorchar.exe /2f "!text_120!"
	echo.
	echo.
	echo  !text_122! : !minus!
	echo.
	echo  !text_124! : !xp_add!
	echo.
	echo  !text_125! : !money_add!
	echo.
	echo.
	
	if !user_side!==order (
	
		call :possibility_calculator 10
		if !possible!==true (
		echo.
		echo  !text_134! !text_38!
		set /a user_order_items_health_potion=!user_order_items_health_potion!+1
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
		echo.
		
		goto :skip_3
		)
	
		call :possibility_calculator 10
		if !possible!==true (
		echo.
		echo  !text_134! !text_39!
		set /a user_order_items_elixir=!user_order_items_elixir!+1
		call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
		echo.
		goto :skip_3
		)
		
		call :possibility_calculator 10
		if !possible!==true (
		echo.

		call :money_add
		echo  !text_134! !text_29! : !money_add!
		set /a user_money=!user_money!+!money_add!
		set /a user_money=!user_money!
		call :change_dll_var_save user_money !user_money!
		echo.
		
		goto :skip_3
		)
	
	
	)
	if !user_side!==chaos (
		call :possibility_calculator 10
		if !possible!==true (
		echo.
		echo  !text_134! !text_135!
		set /a user_chaos_items_number=!user_chaos_items_number!+1
		call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
		echo.
		goto :skip_3
		)

		call :possibility_calculator 10
		if !possible!==true (
		echo.
		
		call :money_add
		echo  !text_134! !text_29! : !money_add!
		set /a user_money=!user_money!+!money_add!
		set /a user_money=!user_money!
		call :change_dll_var_save user_money !user_money!
		echo.
		
		goto :skip_3
		)
	
	)
	:skip_3	
	
	echo.
	echo  !text_9!
	
	
	
	
	
	pause >nul
	cls
	call :level_calculator
	
	
	
	cls
	call :possibility_calculator 40
	if !possible!==true (
	set trader_show=true
	
	)
	if !possible!==false (
	set trader_show=false
	)
	
	
	goto :graphics_mainmenu
	
	goto :eof
	
	::[===============================================================================]
	
	:graphics_loose
	cls
	set minus=
	color 4f
	set /a loose_streak=!loose_streak!+1
	set /a win_streak=0
	call :change_dll_var_save win_streak !win_streak!
	call :change_dll_var_save loose_streak !loose_streak!
	
	set /a minus=50 * !loose_streak! * !loose_streak! * !user_level!
	set /a user_team_number=!user_team_number! - !minus!
	
		if !user_team_number! leq 0 (
		cls
		goto :loose_the_game
		)
	
	
	call :change_dll_var_save user_team_number !user_team_number!
	echo.
	call colorchar.exe /44 " "
	call colorchar.exe /cf "!text_121!"
	echo.
	echo.
	echo  !text_123! : !minus!
	echo.
	echo.
	echo.
	echo  !text_9!
	
	
		::Settings variables
	if !user_side!==order (
		call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
		call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
		call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
		call :change_dll_var_save user_order_items_speed_decreaser !user_order_items_speed_decreaser!
		call :change_dll_var_save user_order_items_mega_strike !user_order_items_mega_strike!
	)
	
	
	if !user_side!==chaos (
		call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
	
	)
	
	pause >nul
	cls
	
	
	
	call :possibility_calculator 40
	if !possible!==true (
	set trader_show=true
	
	)
	if !possible!==false (
	set trader_show=false
	)
	
	goto :graphics_mainmenu
	goto :eof
	
	::[===============================================================================]
	::[===============================================================================]
	::[===============================================================================]
	
	:level_calculator
	
	if !user_level!==5 goto :skip_2
	
	if !user_xp! gtr 6000 if !user_xp! leq 200000 (
		set user_level=5
		call :change_dll_var_save user_level 5
		
		if !user_side!==order (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 1400
			echo  !text_32! + 60
			echo  !text_33! + 40
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
			
			set /a user_order_health_constant=!user_order_health_constant!+1400
			set /a user_order_attack_constant=!user_order_attack_constant!+60
			set /a user_order_speed_constant=!user_order_speed_constant!+40
			set /a user_money=!user_money!+300
			call :change_dll_var_save user_order_health_constant !user_order_health_constant!
			call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
			call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a enemy_chaos_health_constant=!enemy_chaos_health_constant!+2000
			set /a enemy_chaos_attack_constant_start=!enemy_chaos_attack_constant_start!+150
			set /a enemy_chaos_attack_constant_end=!enemy_chaos_attack_constant_end!+150
			set /a enemy_chaos_speed_constant_start=!enemy_chaos_speed_constant_start!+60
			set /a enemy_chaos_speed_constant_end=!enemy_chaos_speed_constant_end!+60
			call :change_dll_var_save enemy_chaos_health_constant !enemy_chaos_health_constant!
			call :change_dll_var_save enemy_chaos_attack_constant_start !enemy_chaos_attack_constant_start!
			call :change_dll_var_save enemy_chaos_attack_constant_end !enemy_chaos_attack_constant_end!
			call :change_dll_var_save enemy_chaos_speed_constant_start !enemy_chaos_speed_constant_start!
			call :change_dll_var_save enemy_chaos_speed_constant_end !enemy_chaos_speed_constant_end!
			
			pause >nul
			cls
			goto :eof
		)
		
		if !user_side!==chaos (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 1400
			echo  !text_32! + [60 - 60]
			echo  !text_33! + [40 - 40]
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
		
			set /a enemy_order_health_constant=!enemy_order_health_constant!+2000
			set /a enemy_order_attack_constant=!enemy_order_attack_constant!+150
			set /a enemy_order_speed_constant=!enemy_order_speed_constant!+60
			set /a user_money=!user_money!+300
			call :change_dll_var_save enemy_order_health_constant !enemy_order_health_constant!
			call :change_dll_var_save enemy_order_attack_constant !enemy_order_attack_constant!
			call :change_dll_var_save enemy_order_speed_constant !enemy_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a user_chaos_health_constant=!user_chaos_health_constant!+1400
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+60
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+60
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+40
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+40
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!

			pause >nul
			cls
			goto :eof
		)
	
	
	
	
	
	
	)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if !user_level!==4 goto :skip_2
	
	if !user_xp! gtr 3500 if !user_xp! leq 6000 (
		set user_level=4
		call :change_dll_var_save user_level 4
		
		if !user_side!==order (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 900
			echo  !text_32! + 50
			echo  !text_33! + 30
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
			
			set /a user_order_health_constant=!user_order_health_constant!+900
			set /a user_order_attack_constant=!user_order_attack_constant!+50
			set /a user_order_speed_constant=!user_order_speed_constant!+30
			set /a user_money=!user_money!+300
			call :change_dll_var_save user_order_health_constant !user_order_health_constant!
			call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
			call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a enemy_chaos_health_constant=!enemy_chaos_health_constant!+1300
			set /a enemy_chaos_attack_constant_start=!enemy_chaos_attack_constant_start!+80
			set /a enemy_chaos_attack_constant_end=!enemy_chaos_attack_constant_end!+80
			set /a enemy_chaos_speed_constant_start=!enemy_chaos_speed_constant_start!+70
			set /a enemy_chaos_speed_constant_end=!enemy_chaos_speed_constant_end!+70
			call :change_dll_var_save enemy_chaos_health_constant !enemy_chaos_health_constant!
			call :change_dll_var_save enemy_chaos_attack_constant_start !enemy_chaos_attack_constant_start!
			call :change_dll_var_save enemy_chaos_attack_constant_end !enemy_chaos_attack_constant_end!
			call :change_dll_var_save enemy_chaos_speed_constant_start !enemy_chaos_speed_constant_start!
			call :change_dll_var_save enemy_chaos_speed_constant_end !enemy_chaos_speed_constant_end!
			
			pause >nul
			cls
			goto :eof
		)
		
		if !user_side!==chaos (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 900
			echo  !text_32! + [50 - 50]
			echo  !text_33! + [30 - 30]
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
		
			set /a enemy_order_health_constant=!enemy_order_health_constant!+1300
			set /a enemy_order_attack_constant=!enemy_order_attack_constant!+70
			set /a enemy_order_speed_constant=!enemy_order_speed_constant!+70
			set /a user_money=!user_money!+300
			call :change_dll_var_save enemy_order_health_constant !enemy_order_health_constant!
			call :change_dll_var_save enemy_order_attack_constant !enemy_order_attack_constant!
			call :change_dll_var_save enemy_order_speed_constant !enemy_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			
			set /a user_chaos_health_constant=!user_chaos_health_constant!+900
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+50
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+50
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+30
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+30
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!

			pause >nul
			cls
			goto :eof
		)
	
	
	
	
	
	
	
	
	
	
	
	)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if !user_level!==3 goto :skip_2
	
	if !user_xp! gtr 1500 if !user_xp! leq 3500 (
		set user_level=3
		call :change_dll_var_save user_level 3
		
		if !user_side!==order (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 500
			echo  !text_32! + 40
			echo  !text_33! + 20
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
			
			set /a user_order_health_constant=!user_order_health_constant!+500
			set /a user_order_attack_constant=!user_order_attack_constant!+40
			set /a user_order_speed_constant=!user_order_speed_constant!+20
			set /a user_money=!user_money!+300
			call :change_dll_var_save user_order_health_constant !user_order_health_constant!
			call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
			call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			
			set /a enemy_chaos_health_constant=!enemy_chaos_health_constant!+800
			set /a enemy_chaos_attack_constant_start=!enemy_chaos_attack_constant_start!+50
			set /a enemy_chaos_attack_constant_end=!enemy_chaos_attack_constant_end!+50
			set /a enemy_chaos_speed_constant_start=!enemy_chaos_speed_constant_start!+40
			set /a enemy_chaos_speed_constant_end=!enemy_chaos_speed_constant_end!+40
			call :change_dll_var_save enemy_chaos_health_constant !enemy_chaos_health_constant!
			call :change_dll_var_save enemy_chaos_attack_constant_start !enemy_chaos_attack_constant_start!
			call :change_dll_var_save enemy_chaos_attack_constant_end !enemy_chaos_attack_constant_end!
			call :change_dll_var_save enemy_chaos_speed_constant_start !enemy_chaos_speed_constant_start!
			call :change_dll_var_save enemy_chaos_speed_constant_end !enemy_chaos_speed_constant_end!
			
			pause >nul
			cls
			goto :eof
		)
		
		if !user_side!==chaos (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 500
			echo  !text_32! + [40 - 40]
			echo  !text_33! + [20 - 20]
			echo  !text_29! + 300
			echo.
			echo.
			echo.
			echo  !text_9!
		
			set /a enemy_order_health_constant=!enemy_order_health_constant!+800
			set /a enemy_order_attack_constant=!enemy_order_attack_constant!+50
			set /a enemy_order_speed_constant=!enemy_order_speed_constant!+40
			set /a user_money=!user_money!+300
			call :change_dll_var_save enemy_order_health_constant !enemy_order_health_constant!
			call :change_dll_var_save enemy_order_attack_constant !enemy_order_attack_constant!
			call :change_dll_var_save enemy_order_speed_constant !enemy_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a user_chaos_health_constant=!user_chaos_health_constant!+500
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+40
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+40
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+20
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+20
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!

			pause >nul
			cls
			goto :eof
		)
		
		
		
		
	
	
	
	
	

	
	
	
	
	
	
	
	)
	
	if !user_level!==2 goto :skip_2
	
	if !user_xp! gtr 500 if !user_xp! leq 1500 (
		set user_level=2
		call :change_dll_var_save user_level 2
		
		
		if !user_side!==order (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 100
			echo  !text_32! + 30
			echo  !text_33! + 20
			echo  !text_29! + 200
			echo.
			echo.
			echo.
			echo  !text_9!
			
			set /a user_order_health_constant=!user_order_health_constant!+100
			set /a user_order_attack_constant=!user_order_attack_constant!+30
			set /a user_order_speed_constant=!user_order_speed_constant!+20
			set /a user_money=!user_money!+200
			call :change_dll_var_save user_order_health_constant !user_order_health_constant!
			call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
			call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a enemy_chaos_health_constant=!enemy_chaos_health_constant!+300
			set /a enemy_chaos_attack_constant_start=!enemy_chaos_attack_constant_start!+40
			set /a enemy_chaos_attack_constant_end=!enemy_chaos_attack_constant_end!+40
			set /a enemy_chaos_speed_constant_start=!enemy_chaos_speed_constant_start!+30
			set /a enemy_chaos_speed_constant_end=!enemy_chaos_speed_constant_end!+30
			call :change_dll_var_save enemy_chaos_health_constant !enemy_chaos_health_constant!
			call :change_dll_var_save enemy_chaos_attack_constant_start !enemy_chaos_attack_constant_start!
			call :change_dll_var_save enemy_chaos_attack_constant_end !enemy_chaos_attack_constant_end!
			call :change_dll_var_save enemy_chaos_speed_constant_start !enemy_chaos_speed_constant_start!
			call :change_dll_var_save enemy_chaos_speed_constant_end !enemy_chaos_speed_constant_end!
			
			pause >nul
			cls
			goto :eof
		)
		
		if !user_side!==chaos (
			color 6e
			echo.
			call colorchar.exe /66 " "
			call colorchar.exe /6f "!text_126!"
			echo.
			echo.
			echo  !text_31! + 100
			echo  !text_32! + [30 - 30]
			echo  !text_33! + [20 - 20]
			echo  !text_29! + 200
			echo.
			echo.
			echo.
			echo  !text_9!
		
			set /a enemy_order_health_constant=!enemy_order_health_constant!+300
			set /a enemy_order_attack_constant=!enemy_order_attack_constant!+40
			set /a enemy_order_speed_constant=!enemy_order_speed_constant!+30
			set /a user_money=!user_money!+200
			call :change_dll_var_save enemy_order_health_constant !enemy_order_health_constant!
			call :change_dll_var_save enemy_order_attack_constant !enemy_order_attack_constant!
			call :change_dll_var_save enemy_order_speed_constant !enemy_order_speed_constant!
			call :change_dll_var_save user_money !user_money!
			
			set /a user_chaos_health_constant=!user_chaos_health_constant!+100
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+30
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+30
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+20
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+20
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!

			pause >nul
			cls
			goto :eof
		)
		
		
		
		
		
		
		
		
		
		
		
		
		
	)

	
	
	
	
	
	
	
	:skip_2
	
	
	goto :eof
	
	::[===============================================================================]
	
	:win_the_game
	cls
	color 8f
	echo.
	call colorchar.exe /88 " " 
	call colorchar.exe /2f "!text_127!"
	echo.
	if not !game_mode!==personal (
	echo.
	echo  !text_136!
	echo.
	echo  !text_137!
	echo  !text_138!
	echo  !text_139!
	echo  !text_140!
	echo  !text_136!>>cheat_codes.txt
	echo  !text_137!>>cheat_codes.txt
	echo  !text_138!>>cheat_codes.txt
	echo  !text_139!>>cheat_codes.txt
	echo  !text_140!>>cheat_codes.txt
	)
	echo.
	echo.
	echo.
	timeout /t 3 >nul /nobreak
	echo  !text_9!
	pause >nul
	goto :resetgame
	goto :eof
	
	::[===============================================================================]
	
	:loose_the_game
	cls
	color 8f
	echo.
	call colorchar.exe /88 " " 
	call colorchar.exe /4f "!text_128!"
	echo.
	echo.
	echo.
	echo.
	echo  !text_9!
	pause >nul
	goto :resetgame
	goto :eof
	
	::[===============================================================================]
	
	:graphics_magic_market
	cls
	color 70
	call colorchar.exe /7f "                                                                                                                       "
	echo.
	echo  [ !text_129! ] [ !text_29! : !user_money! ]
	echo.
	
	if !user_side!==order (
	echo.
	echo      !text_49! !text_49!                              !text_62!
	echo.
	echo.
	echo.
	echo      !text_52!!text_130!                               !text_63!
	echo      [-30]                [-150]                                              [-80]
	echo.
	echo      !text_55!!text_131!                               !text_64!
	echo      [-50]                [-250]                                              [-90]
	echo.
	echo      !text_58!                                                   !text_65!
	echo      [-5]                                                                    [-100]
	echo.
	echo      !text_61!         
	echo      [-70]
	echo.
	echo.
	echo.
	echo                                                                                                   !text_47!
	echo.
	echo.
	echo.
	call colorbox.exe /88 1 3 20 25
	call colorbox.exe /88 21 3 40 25
	call colorbox.exe /88 71 3 110 17
	call colorbox.exe /88 89 19 111 26
	
	::COLORS
	call colorbox.exe /66 0 0 10 0
	call colorbox.exe /ff 11 0 20 0
	call colorbox.exe /66 21 0 30 0
	call colorbox.exe /ff 31 0 40 0
	call colorbox.exe /66 41 0 50 0
	call colorbox.exe /ff 51 0 60 0
	call colorbox.exe /66 61 0 70 0
	call colorbox.exe /ff 71 0 80 0
	call colorbox.exe /66 81 0 90 0
	call colorbox.exe /ff 91 0 100 0
	call colorbox.exe /66 101 0 110 0
	call colorbox.exe /ff 111 0 119 0
	
	set box_market_1=2 8 19 10
	set box_market_2=2 11 19 13
	set box_market_3=2 14 19 16
	set box_market_4=2 17 19 19
	set box_market_5=22 8 39 10
	set box_market_6=22 11 39 13
	
	set box_market_7=72 8 109 10
	set box_market_8=72 11 109 13
	set box_market_9=72 14 109 16
	set box_market_10=90 20 110 25
	call getinput.exe /M !box_market_1! !box_market_2! !box_market_3! !box_market_4! !box_market_5! !box_market_6! !box_market_7! !box_market_8! !box_market_9! !box_market_10!  /H f0
	set choice__magic_market=!errorlevel!
	
		if !choice__magic_market!==1 (
			
			if !user_money! geq 30 (
			set /a user_order_items_health_potion=!user_order_items_health_potion!+1
			set /a user_money=!user_money!-30
			call :change_dll_var_save user_order_items_health_potion !user_order_items_health_potion!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_71!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
		
		)
		
		
		
		if !choice__magic_market!==2 (

			if !user_money! geq 50 (
			set /a user_order_items_elixir=!user_order_items_elixir!+1
			set /a user_money=!user_money!-50
			call :change_dll_var_save user_order_items_elixir !user_order_items_elixir!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_73!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
		
		)
		
		
		if !choice__magic_market!==3 (
		
			if !user_money! geq 5 (
			set /a user_order_items_smoke=!user_order_items_smoke!+1
			set /a user_money=!user_money!-5
			call :change_dll_var_save user_order_items_smoke !user_order_items_smoke!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_74!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
		
		
		)
		
		
	if !choice__magic_market!==4 (
	
			if !user_money! geq 70 (
			set /a user_order_items_speed_booster=!user_order_items_speed_booster!+1
			set /a user_money=!user_money!-70
			call :change_dll_var_save user_order_items_speed_booster !user_order_items_speed_booster!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_75!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
	
	)
		
		
			if !choice__magic_market!==5 (
	
			if !user_money! geq 150 (
			set /a user_order_items_speed_decreaser=!user_order_items_speed_decreaser!+1
			set /a user_money=!user_money!-150
			call :change_dll_var_save user_order_items_speed_decreaser !user_order_items_speed_decreaser!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_132!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
	
	)

		
			if !choice__magic_market!==6 (
	
			if !user_money! geq 250 (
			set /a user_order_items_mega_strike=!user_order_items_mega_strike!+1
			set /a user_money=!user_money!-250
			call :change_dll_var_save user_order_items_mega_strike !user_order_items_mega_strike!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_133!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_72!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
	
	)
		
		
		
		

		

		
		

	
	
	)
		
	if !choice__magic_market!==7 (
	
		if !user_money! geq 80 (
		set /a user_order_health_constant=!user_order_health_constant!+50
		set /a user_money=!user_money!-80
		call :change_dll_var_save user_order_health_constant !user_order_health_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_85!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)
	
	)
	
	if !choice__magic_market!==8 (
	
		if !user_money! geq 90 (
		set /a user_order_attack_constant=!user_order_attack_constant!+20
		set /a user_money=!user_money!-90
		call :change_dll_var_save user_order_attack_constant !user_order_attack_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_86!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)
	
	
	)
		
	
	
	if !choice__magic_market!==9 (
	
		if !user_money! geq 100 (
		set /a user_order_speed_constant=!user_order_speed_constant!+10
		set /a user_money=!user_money!-100
		call :change_dll_var_save user_order_speed_constant !user_order_speed_constant!
		call :change_dll_var_save user_money !user_money!
		cls
		echo.
		echo  !text_87!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)else (
		cls
		echo.
		echo  !text_84!
		timeout /t 3 >nul
		cls
		goto :graphics_magic_market
		)
	
	)
		
		
		
		
	
	if !choice__magic_market!==10 (
		cls
		goto :graphics_battletower
	)
	
	
	
	
	)
	
	if !user_side!==chaos (
	echo.
	echo    !text_66!                                   !text_62!
	echo.
	echo.
	echo.
	echo      !text_67!                               !text_68!
    echo      [-30]                                                                 [-80]
	echo.
	echo                                                                            !text_69!
	echo                                                                            [-90] 
	echo.
	echo                                                                            !text_70!
	echo                                                                            [-100]
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo                                                                                                   !text_47!
	echo.
	echo.
	echo.
	call colorbox.exe /8f 71 3 110 17
	call colorbox.exe /8f 1 3 20 12
	call colorbox.exe /8f 89 19 111 26
	
	::COLORS
	call colorbox.exe /66 0 0 10 0
	call colorbox.exe /ff 11 0 20 0
	call colorbox.exe /66 21 0 30 0
	call colorbox.exe /ff 31 0 40 0
	call colorbox.exe /66 41 0 50 0
	call colorbox.exe /ff 51 0 60 0
	call colorbox.exe /66 61 0 70 0
	call colorbox.exe /ff 71 0 80 0
	call colorbox.exe /66 81 0 90 0
	call colorbox.exe /ff 91 0 100 0
	call colorbox.exe /66 101 0 110 0
	call colorbox.exe /ff 111 0 119 0

	set box_market_15=2 7 19 10
	set box_market_16=72 8 109 10
	set box_market_17=72 11 109 13
	set box_market_18=72 14 109 16
	set box_market_19=90 20 110 25
	call getinput.exe /M !box_market_15! !box_market_16! !box_market_17! !box_market_18! !box_market_19! /H f0
	set choice__magic_market_2=!errorlevel!
	
		
	if !choice__magic_market_2!==1 (
		
			if !user_money! geq 30 (
			set /a user_chaos_items_number=!user_chaos_items_number!+1
			set /a user_money=!user_money!-30
			call :change_dll_var_save user_chaos_items_number !user_chaos_items_number!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_89!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_88!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
		
	)
	
	
	
	
	
	if !choice__magic_market_2!==2 (
		
			if !user_money! geq 80 (
			set /a user_chaos_health_constant=!user_chaos_health_constant!+50
			set /a user_money=!user_money!-80
			call :change_dll_var_save user_chaos_health_constant !user_chaos_health_constant!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_85!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
		
	)
	
	
	if !choice__magic_market_2!==3 (
	
			if !user_money! geq 90 (			
			set /a user_chaos_attack_constant_start=!user_chaos_attack_constant_start!+20
			set /a user_chaos_attack_constant_end=!user_chaos_attack_constant_end!+20
			set /a user_money=!user_money!-90	
			call :change_dll_var_save user_chaos_attack_constant_start !user_chaos_attack_constant_start!
			call :change_dll_var_save user_chaos_attack_constant_end !user_chaos_attack_constant_end!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_90!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)
	
	)
	
	
	if !choice__magic_market_2!==4 (
	
			if !user_money! geq 100 (			
			set /a user_chaos_speed_constant_start=!user_chaos_speed_constant_start!+10
			set /a user_chaos_speed_constant_end=!user_chaos_speed_constant_end!+10
			set /a user_money=!user_money!-100	
			call :change_dll_var_save user_chaos_speed_constant_start !user_chaos_speed_constant_start!
			call :change_dll_var_save user_chaos_speed_constant_end !user_chaos_speed_constant_end!
			call :change_dll_var_save user_money !user_money!
			cls
			echo.
			echo  !text_91!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)else (
			cls
			echo.
			echo  !text_84!
			timeout /t 3 >nul
			cls
			goto :graphics_magic_market
			)	
	
	
	
	
	
	)
	
	
	
	
	
	
	if !choice__magic_market_2!==5 (
		cls
		goto :graphics_battletower
	)
	
	
	
	
	
	)

	
	cls
	goto :graphics_magic_market
	goto :eof
	
	
	
	
	

	
	::[===============================================================================]
	
	:money_add 
	set /a money_add=( !random! %% 100 ) + 1
	
	goto :eof
	
	
	