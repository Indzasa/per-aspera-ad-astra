require "compatibility.scrap-industry-data"
require "compatibility.lumber-mill-data"
require "compatibility.recipe-fixes-data"

--[[
New stuff to implement:

Paracelin and Moshine accumulator compatibility (make acc from moshine take one from paracelin as ingredient)
new milestones!
fluroflux nutrients category doesnt affect biochemical facility from aop
Arig and BZ Carbon both have diamonds that are different items, unify them?
BZ Silicon, Muluna, Moshine, Arig have silicon and other silica... need to investigate
AAI Industry, Lignumus and Wooden Logistics conflict in belts, disabled AAI for now
    fixed (убрал мод directors cut который пофторно делает внедрение древесного конвеера)
    еще сильнее пофиксил - убрал wooden logistics
Cerys gives holmium recrystalisation recipe (isn't needed with EM Holmium charging mod)
removed hyarion due to conflicting promethium recipe, belts with Aquilo Overhaul: Lithium Battery
molten plastics and wooden industry resin
bz silica and silicon and moshine and other silicpn resourses
зеленые платы лигнумус делает из деревянных и создает неэффективный рецепт без них но этот рецепт не учитывает модификации модами от BZ
переработка в recycler лесопилки дает не те материалы из которых она была сделана
аналогично в моде mini trains lead the way - проблема в том что рецепты надо менять на data stage
конвееры из модов arig/hyarion и better aquillo оба делаются из зеленого, нужно сделать чтоббы один из другого следовал, а еще отсутствует loader для 90
AAI Industy создает лишние рецепты (зеленая плата - не все материалы из BZ) и нефтянка (не учтены моды на нефтянку типа scrappy chemistry), убрать бы их
--]]