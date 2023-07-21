local ToWString = userMods.ToWString
local FromWString = userMods.FromWString
-- interface module
Global("locales", nil)
Global("StateToColor", nil)
Global("StateToText", nil)
--------------------------------------------------------------------------------
--------------------------------- Russian --------------------------------------
--------------------------------------------------------------------------------

locales = {
    ["locName"] = Utf8ToAnsi("Колизей Хранителя"),
    ["startMsg"] = Utf8ToAnsi("запущен."),

    ["impassable"] = Utf8ToAnsi("Не проходимый:"),
    ["passable"] = Utf8ToAnsi("Проходимый:"),
    ["sopassable"] = Utf8ToAnsi("Трудный:"),

    ["states"] = {
        [Utf8ToAnsi(
            "ИзиХран проходится даже с тупящими рандомами")] = 0,
        [Utf8ToAnsi(
            "Проходится довольно легко если никто не тупит")] = 1,
        [Utf8ToAnsi("Сложный и лучше пропустить.")] = 2,
        [Utf8ToAnsi(
            "Можно не залутать сундук хилом, если на момент смерти на нём (хиле) висит безмолвие на момент смерти храна. На 10-20% храна выпить яд и умереть.")] = 3,
        [Utf8ToAnsi(
            "Слышал что убивается, но мне не попадался чтобы попробовать.")] = 4
    },

    ["defenders"] = {
        -- HARD
        [Utf8ToAnsi("Айронмен")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Айронболз"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Харон")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Ангелочек")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Лига"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Астарот")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Ревенджерс"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Брысъ")] = {
            ["state"] = "3",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Дебаф на снижение исцеления на хила (при чистке снимает 90%хп). Чистить ярость с него. Кайтить из луж. Вешает безмолвие (можно хилить только в столбах)."),
            ["state_title"] = Utf8ToAnsi(
                "Можно не залутать сундук хилом, если на момент смерти на нём (хиле) висит безмолвие на момент смерти храна. На 10-20% храна выпить яд и умереть.")
        },
        [Utf8ToAnsi("Варяг")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Володяледокол")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Чеверный фронт"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Диктатор")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Северная Корея"),
            ["info"] = Utf8ToAnsi("Лужи, созвездия, узы."),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Зверюга")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Армагеддон"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Квант")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Болванчик, Вскипание крови не чистить, Эссенции"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Комитетчик")] = {
            ["state"] = "0",
            ["guild"] = Utf8ToAnsi("Совет Империи"),
            ["info"] = Utf8ToAnsi(
                "Просто болванчик который травит (можно не чистить)"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Кронос")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Время"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Куколд")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Люцифер")] = {
            ["state"] = "1",
            ["guild"] = Utf8ToAnsi("Неба жители"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Проходится довольно легко если никто не тупит")
        },
        [Utf8ToAnsi("Можноливать")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Без коментариев"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Мопкеу")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Просто болванчик который травит (можно не чистить)"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Пересбор")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Валгалла"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Повариха")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Пту"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Пророксанбой")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Золотая орда"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Проходится довольно легко если никто не тупит")
        },
        [Utf8ToAnsi("Птаха")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Смерш"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Седойдемон")] = {
            ["state"] = "1",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Лужи, созвездия, узы."),
            ["state_title"] = Utf8ToAnsi(
                "Проходится довольно легко если никто не тупит")
        },
        [Utf8ToAnsi("Срулик")] = {
            ["state"] = "1",
            ["guild"] = Utf8ToAnsi("Триумвират"),
            ["info"] = Utf8ToAnsi(
                "Какой-то каст нужно сбивать чтобы на танка не повесил Кровавую метку и не начал отхил от ударов по нему."),
            ["state_title"] = Utf8ToAnsi(
                "Проходится довольно легко если никто не тупит")
        },
        [Utf8ToAnsi("Стикс")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Титанвероны")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Каэртаген"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Хантер")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Челмедведосвин")] = {
            ["state"] = "0",
            ["guild"] = Utf8ToAnsi("Южный парк"),
            ["info"] = Utf8ToAnsi(
                "Нужно кайтить, в остальном изи."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Ярость")] = {
            ["state"] = "3",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Вешает безмолвие (можно хилить только в столбах)."),
            ["state_title"] = Utf8ToAnsi(
                "Можно не залутать сундук хилом, если на момент смерти на нём (хиле) висит безмолвие на момент смерти храна. На 10-20% храна выпить яд и умереть.")
        },
        -- HARD

        -- NORAML
        [Utf8ToAnsi("Аим")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Кидает дебаф с периодическим уроном (кровь). Можно не чистить или только по одному. При чистке наносит АоЕ урон, Эссенции"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Айнзоулгон")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("болванчик"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Айнцолгон")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Банхаммер")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Бассо")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Бобик")] = {
            ["state"] = "4",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Кидает под игроков лужи которые хилят храна. Кидает дефаф (щит) на случайных игроков который станит тех кто в него попадает."),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Буся")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Весемир")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Витольдчемпион")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Искры"),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Геликаннн")] = {
            ["state"] = "4",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Лужи созвездия вскипание крови"),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Героймарвел")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Кровавый пакт и магия крови  сбивать каст"),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Гнагмутог")] = {
            ["state"] = "4",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Делает разбежки в случайного игрока и шотает, если не увернуться."),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Гризли")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Дебаф на снижение исцеления на хила (при чистке снимает 95%хп). Чистить ярость с него. Кайтить из луж."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Гринёв")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Демиург")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Инквизиция"),
            ["info"] = Utf8ToAnsi("Рывки"),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Деструкт")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Паритет"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Зверюга")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Знаменосец")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Кискасофы")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Эсенции. Просто болванчик."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Кроха")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Нельзя останавливаться."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Курама")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Эндлес"),
            ["info"] = Utf8ToAnsi(
                "Безмолвие чистить. Хилится в своей луже."),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Лаит")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Призывает эсенции (нужно сливать), в остальном столб."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Медив")] = {
            ["state"] = "4",
            ["guild"] = Utf8ToAnsi("Кракен"),
            ["info"] = Utf8ToAnsi(
                "Лужи, созвездия, кровь не чисттить."),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Миллиардр")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Негатив")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Рывки"),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Плотва")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Пьянымилтен")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Эсенции. Созвездия. Вскипание крови."),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Рнагмутог")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Секатор")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Секира")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Просто болванчик."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Скарбранд")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Лужи, Станящий шит, созвездия"),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Старший брат")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Болванчик. Периодически кидает вокруг себя отравление."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        },
        [Utf8ToAnsi("Стражпирамид")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Тегмуиатог")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Тигра")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Искры"),
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Фикссон")] = {
            ["state"] = "4",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Лужи, созвездия, кровь не чисттить."),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Хомякгреха")] = {
            ["state"] = "4",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi(
                "Делает разбежки в случайного игрока и шотает."),
            ["state_title"] = Utf8ToAnsi(
                "Слышал что убивается, но мне не попадался чтобы попробовать.")
        },
        [Utf8ToAnsi("Хубабублин")] = {
            ["state"] = "2",
            ["guild"] = Utf8ToAnsi("Хубабублины"),
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Циркулярка")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Чиллотрон")] = {
            ["state"] = "2",
            ["guild"] = "",
            ["info"] = "",
            ["state_title"] = Utf8ToAnsi(
                "Сложный и лучше пропустить.")
        },
        [Utf8ToAnsi("Чулочки")] = {
            ["state"] = "0",
            ["guild"] = "",
            ["info"] = Utf8ToAnsi("Просто болванчик."),
            ["state_title"] = Utf8ToAnsi(
                "ИзиХран проходится даже с тупящими рандомами")
        }
        -- NORAML

        -- [Utf8ToAnsi("Страж")] = {["state"] = true, ["info"] = Utf8ToAnsi("текст")},
    }
}

StateToColor = {
    ["0"] = "Green",
    ["1"] = "Green",
    ["2"] = "Red",
    ["3"] = "Orange",
    ["4"] = "Orange"
}

StateToText = {
    ["0"] = locales["passable"],
    ["1"] = locales["passable"],
    ["2"] = locales["impassable"],
    ["3"] = locales["sopassable"],
    ["4"] = locales["sopassable"]
}
