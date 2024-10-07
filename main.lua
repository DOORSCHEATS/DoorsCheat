local RoomsToSave = game.ReplicatedStorage:FindFirstChild("RoomsToSave")

if not RoomsToSave then
	RoomsToSave = Instance.new("Folder", game.ReplicatedStorage)
	RoomsToSave.Name = "RoomsToSave"
end

function SaveRooms()
	for i, Room in workspace.CurrentRooms:GetChildren() do
		local RoomNumber = tonumber(Room.Name)
		
		if RoomNumber and Room:FindFirstChild("Assets") and not RoomsToSave:FindFirstChild(Room:GetAttribute("RawName")) then
			
			local CloneRoom = Room:Clone()
			
			CloneRoom.Parent = RoomsToSave
			CloneRoom.Name = CloneRoom:GetAttribute("RawName")
			CloneRoom:FindFirstChild(RoomNumber).Name = "BaseCheck"
			CloneRoom.Door:Destroy()
			
			CloneRoom:SetAttribute("Ambient", Color3.fromRGB(67, 51, 53))
			for i, v in CloneRoom:GetDescendants() do
				if v:IsA("BillboardGui") or v:IsA("Highlight") then
					v:Destroy()
				end
				task.wait(0.02)
			end
		end
	end
end

SaveRooms()

workspace.CurrentRooms.ChildAdded:Connect(SaveRooms)
