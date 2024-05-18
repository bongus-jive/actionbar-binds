local lastGroup

function init()
  if not starExtensions and script.updateDt() ~= 0 then
    script.setUpdateDelta(0)
    sb.logWarn("'Action Bar Binds' requires StarExtensions - https://github.com/StarExtensions/StarExtensions/releases")
  end

  lastGroup = player.actionBarGroup()
end

function update()
  if input.bindDown("pat_actionbarbinds", "prev") then
    player.setActionBarGroup(lastGroup - 1)
  end

  lastGroup = player.actionBarGroup()
  
  for i = 7, 12 do
    if input.bindDown("pat_actionbarbinds", tostring(i)) then
      player.setSelectedActionBarSlot(i)
      break
    end
  end
end
