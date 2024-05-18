local lastGroup, maxGroups

function init()
  if not starExtensions and script.updateDt() ~= 0 then
    script.setUpdateDelta(0)
    sb.logWarn("'Action Bar Binds' requires StarExtensions - https://github.com/StarExtensions/StarExtensions/releases")
    return
  end

  lastGroup = player.actionBarGroup()
  maxGroups = root.assetJson("/player.config:inventory.customBarGroups")
end

function update()
  if input.bindDown("pat_actionbarbinds", "prev") then
    local newGroup = ((lastGroup - 2) % maxGroups) + 1
    player.setActionBarGroup(newGroup)
  end

  lastGroup = player.actionBarGroup()
  
  for i = 7, 12 do
    if input.bindDown("pat_actionbarbinds", tostring(i)) then
      player.setSelectedActionBarSlot(i)
      break
    end
  end
end
