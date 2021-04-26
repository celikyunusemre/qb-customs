QBCore = nil
jobName = nil

CreateThread(function()
    while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Wait(200)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    jobName = QBCore.Functions.GetPlayerData().job.name
    updateUICurrentJob()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    jobName = QBCore.Functions.GetPlayerData().job.name
    updateUICurrentJob()
end)