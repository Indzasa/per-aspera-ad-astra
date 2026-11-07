do return end
-- Сначала проверяем, что мод Milestones вообще есть
if not script.active_mods["Milestones"] then return end

-- Конструкторы вех (оставляем без изменений)
local function item(name, quantity, extra)
    local e = {type = "item", name = name, quantity = quantity or 1}
    if extra then for k, v in pairs(extra) do e[k] = v end end
    return e
end

local function consumed(name, quantity)
    return {type = "item_consumption", name = name, quantity = quantity or 1}
end

local function fluid(name, quantity, extra)
    local e = {type = "fluid", name = name, quantity = quantity or 1}
    if extra then for k, v in pairs(extra) do e[k] = v end end
    return e
end

local function kill(name, quantity)
    return {type = "kill", name = name, quantity = quantity or 1}
end

local function tech(name)
    return {type = "technology", name = name, quantity = 1}
end

local function alias(name, equals)
    return {type = "alias", name = name, equals = equals, quantity = 1}
end

-- Логика проверки прототипов (без изменений)
local function exists(e)
    if e.type == "group" then return true end
    if e.type == "alias" then return game.item_prototypes[e.equals] ~= nil end
    local protos = {
        item             = game.item_prototypes,
        item_consumption = game.item_prototypes,
        fluid            = game.fluid_prototypes,
        kill             = game.entity_prototypes,
        technology       = game.technology_prototypes,
    }
    local p = protos[e.type]
    return not p or p[e.name] ~= nil
end

-- Функция section (собирает только то, что реально есть)
local function section(mod, name, entries, list)
    if mod and not script.active_mods[mod] then return end
    local kept = {}
    for _, e in ipairs(entries) do
        if exists(e) then kept[#kept + 1] = e end
    end
    if #kept > 0 then
        list[#list + 1] = {type = "group", name = name}
        for _, e in ipairs(kept) do list[#list + 1] = e end
    end
end

-- Регистрируем интерфейс ОДИН РАЗ, снаружи
remote.add_interface("per-aspera-ad-astra", {
    milestones_presets = function()
        local list = {}

        section(nil, "Common Resources", {
            item("lumber"),
            item("stone-brick"),
            item("iron-plate"),
            item("copper-plate"),
            item("lead-plate"),
            item("tin-plate"),
            item("steel-plate"),
            item("zirconia"),
            item("coke"),
        }, list)

        section(nil, "Science", {
            consumed("wood-science-pack"),
            consumed("steam-science-pack"),
            consumed("automation-science-pack"),
            consumed("logistic-science-pack"),
            consumed("military-science-pack"),
            consumed("chemical-science-pack"),
            consumed("production-science-pack"),
            consumed("utility-science-pack"),
            consumed("space-science-pack"),
            consumed("metallurgic-science-pack"),
            consumed("electromagnetic-science-pack"),
            consumed("agricultural-science-pack"),
            consumed("cryogenic-science-pack"),
        }, list)

        section("lignumis", "Lignumis", {
            tech("planet-discovery-lignumis"),
            item("peat"),
            item("gold-plate"),
            fluid("wood-pulp"),
            item("cupriavidus-necator"),
            item("gold-quality-catalyst"),
            item("gold-module-3"),
            kill("lignumis-small-wriggler-pentapod"),
            kill("lignumis-medium-wriggler-pentapod"),
        }, list)

        section(nil, "Nauvis", {
            tech("planet-discovery-nauvis"),
            item("uranium-concentrate"),
            item("biter-egg"),
            item("biolab"),
            kill("small-biter"),
            kill("medium-biter"),
            kill("big-biter"),
            kill("behemoth-biter"),
        }, list)

        section("planet-muluna", "Muluna", {
            tech("planet-discovery-muluna"),
            item("stone-crushed"),
            item("aluminum-plate"),
            fluid("oxygen"),
            item("muluna-greenhouse-wood"),
            item("cellulose"),
            fluid("tar"),
            item("muluna-microcellular-plastic"),
            fluid("muluna-astronomical-data"),
        }, list)

        section(nil, "Vulcanus", {
            tech("planet-discovery-vulcanus"),
            item("calcite"),
            item("rough-diamond"),
            item("carbonut-seed"),
            item("sulfuric-bacteria"),
            item("tungsten-carbide"),
            item("foundry"),
            item("big-mining-drill"),
            item("big-crusher"),
            item("turbo-transport-belt"),
            kill("small-demolisher"),
            kill("medium-demolisher"),
            kill("big-demolisher"),
        }, list)

        section(nil, "Fulgora", {
            tech("planet-discovery-fulgora"),
            item("recycler"),
            item("coralmium"),
            fluid("fulgora-oil"),
            fluid("holmium-solution"),
            item("electromagnetic-plant"),
            item("lightning-collector"),
            item("charged-iron-matrix"),
            item("stone-bacteria"),
        }, list)

        section(nil, "Gleba", {
            tech("planet-discovery-gleba"),
            item("jelly"),
            item("yumako-mash"),
            item("razorgrass-dried"),
            item("biochamber"),
            item("slipstack-seed"),
            item("fluroflux"),
            item("urano-bacteria"),
            item("stack-inserter"),
            alias("overgrowth-yumako-soil", "overgrowth-jellynut-soil"),
            kill("small-strafer-pentapod"),
            kill("medium-strafer-pentapod"),
            kill("big-strafer-pentapod"),
        }, list)

        section(nil, "Aquilo", {
            tech("planet-discovery-aquilo"),
            fluid("ammoniacal-solution"),
            item("lithium-plate"),
            item("algacultural-bay"),
            item("cryogenic-plant"),
            item("seabloom"),
            item("quantum-processor"),
        }, list)

        section(nil, "By-products and production waste", {
            item("woodchips", 1000, {next = "x100"}),
            item("sand", 1000, {next = "x100"}),
            item("iron-scrap", 1000, {next = "x100"}),
            item("copper-scrap", 1000, {next = "x100"}),
            item("mech-scrap", 1000, {next = "x100"}),
            item("circuit-scrap", 1000, {next = "x100"}),
            item("lead-scrap", 1000, {next = "x100"}),
            item("steel-scrap", 1000, {next = "x100"}),
            item("plastic-bits", 1000, {next = "x100"}),
            item("titanium-scrap", 1000, {next = "x100"}),
            item("tungsten-scrap", 1000, {next = "x100"}),
            item("holmium-scrap", 1000, {next = "x100"}),
            item("lithium-dust", 1000, {next = "x100"}),
            item("spoilage", 1000, {next = "x100"}),
            item("tar", 1000, {next = "x100"}),
            fluid("butane", 1000, {next = "x1000"}),
            fluid("sour-gas", 1000, {next = "x1000"}),
            fluid("naphtha", 1000, {next = "x1000"}),
            fluid("methane", 1000, {next = "x1000"}),
        }, list)

        -- Возвращаем таблицу пресетов — это то, что ждёт Milestones
        return {
            ["Per Aspera Ad Astra — REQUIRED FOR THIS MODPACK"] = {
                required_mods = {"per-aspera-ad-astra"},
                milestones = list,
            },
        }
    end,
})
