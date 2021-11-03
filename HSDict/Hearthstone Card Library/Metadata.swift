//
//  Metadata.swift
//  Hearthstone Card Library
//
//  Created by Byungwook Jeong on 2021/05/06.
//

import Foundation

// MARK: - Card
// Card Set
// * 영웅 초상화: 17 (특이 케이스)
// * standard: 정규 세트, wild: 야생 세트, all: 모든 카드 (초상화 포함)

let standardSetInfos: [(Int, String)] = [
    (1578, "united-in-stormwind"),
    (1525, "forged-in-the-barrens"),
    (1466, "madness-at-the-darkmoon-faire"),
    (1443, "scholomance-academy"),
    (1414, "ashes-of-outland"),
    (1637, "core")
]

let wildSetInfos: [(Int, String)] = [
    (1463, "demonhunter-initiate"),
    (1403, "galakronds-awakening"),
    (1347, "descent-of-dragons"),
    (1158, "saviors-of-uldum"),
    (1130, "rise-of-shadows"),
    (1129, "rastakhans-rumble"),
    (1127, "the-boomsday-project"),
    (1125, "the-witchwood"),
    (1004, "kobolds-and-catacombs"),
    (1001, "knights-of-the-frozen-throne"),
    (27, "journey-to-ungoro"),
    (25, "mean-streets-of-gadgetzan"),
    (23, "one-night-in-karazhan"),
    (21, "whispers-of-the-old-gods"),
    (20, "league-of-explorers"),
    (15, "the-grand-tournament"),
    (14, "blackrock-mountain"),
    (13, "goblins-vs-gnomes"),
    (12, "naxxramas"),
    (1635, "legacy")
]

let classicSetInfo: (Int, String) = (1646, "classic-cards")

let classInfos: [(Int, String)] = [
    (14, "demonhunter"),
    (2, "druid"),
    (3, "hunter"),
    (4, "mage"),
    (5, "paladin"),
    (6, "priest"),
    (7, "rogue"),
    (8, "shaman"),
    (9, "warlock"),
    (10, "warrior"),
    (12, "neutral")
]

let cardTypeInfos: [(Int, String)] = [
    (3, "hero"),
    (4, "minion"),
    (5, "spell"),
    (7, "weapon")
]

let minionTypeInfos: [(Int, String)] = [
    (26, "all"),
    (20, "beast"),
    (15, "demon"),
    (24, "dragon"),
    (18, "elemental"),
    (17, "mech"),
    (14, "murloc"),
    (23, "pirate"),
    (43, "quilboar"),
    (21, "totem")
]

let spellSchoolInfos: [(Int, String)] = [
    (1, "arcane"),
    (2, "fire"),
    (3, "frost"),
    (4, "nature"),
    (5, "holy"),
    (6, "shadow"),
    (7, "fel")
]

let gradeInfos: [(Int, String)] = [
    (1, "common"),
    (2, "free"),
    (3, "rare"),
    (4, "epic"),
    (5, "legendary")
]

let keywordInfos: [(Int, String, String)] = [
    (1, "taunt", "taunt-comment"),
    (2, "spellpower", "spellpower-comment"),
    (3, "divine-shield", "divine-shield-comment"),
    (4, "charge", "charge-comment"),
    (5, "secret", "secret-comment"),
    (6, "stealth", "stealth-comment"),
    (8, "battlecry", "battlecry-comment"),
    (10, "freeze", "freeze-comment"),
    (11, "windfury", "windfury-comment"),
    (12, "deathrattle", "deathrattle-comment"),
    (13, "combo", "combo-comment"),
    (14, "overload", "overload-comment"),
    (15, "silence", "silence-comment"),
    (16, "counter", "counter-comment"),
    (17, "immune", "immune-comment"),
    (19, "spare-part", "spare-part-comment"),
    (20, "inspire", "inspire-comment"),
    (21, "discover", "discover-comment"),
    (31, "quest", "quest-comment"),
    (32, "poisonous", "poisonous-comment"),
    (34, "adapt", "adapt-comment"),
    (38, "lifesteal", "lifesteal-comment"),
    (39, "recruit", "recruit-comment"),
    (52, "echo", "echo-comment"),
    (53, "rush", "rush-comment"),
    (61, "overkill", "overkill-comment"),
    (64, "startofgamekeyword", "startofgamekeyword-comment"),
    (66, "modular", "modular-comment"),
    (71, "evilzug", "evilzug-comment"),
    (76, "twinspell", "twinspell-comment"),
    (77, "mega-windfury", "mega-windfury-comment"),
    (78, "reborn", "reborn-comment"),
    (79, "empower", "empower-comment"),
    (86, "outcast", "outcast-comment"),
    (88, "spellburst", "spellburst-comment"),
    (89, "sidequest", "sidequest-comment"),
    (91, "corrupt", "corrupt-comment"),
    (92, "start-of-combat", "start-of-combat-comment"),
    (96, "questline", "questline-comment"),
    (97, "trade", "trade-comment"),
    (99, "frenzy", "frenzy-comment"),
    (104, "spellpowernature", "spellpowernature-comment"),
    (109, "blood-gem", "blood-gem-comment")
]

// MARK: - Card Back

let sortCategoryInfos: [(Int, String)] = [
    (1, "basic"),
    (2, "fireside"),
    (3, "achieve"),
    (4, "heroes"),
    (5, "season"),
    (6, "legend"),
    (7, "esports"),
    (8, "game_license"),
    (9, "promotion"),
    (10, "pre_purcahse"),
    (11, "blizzard"),
    (12, "golden"),
    (13, "events")
]
