window.addEventListener('message', function(event) {
    if (event.data.action === "updateHUD") {
        document.getElementById('id').innerText = event.data.id;
        document.getElementById('job').innerText = event.data.job;
        document.getElementById('name-id').innerText = event.data.name + ` (${event.data.id})`;
        document.getElementById('cash').innerText = `$${event.data.cash.toLocaleString()}`;
        document.getElementById('bank').innerText = `$${event.data.bank.toLocaleString()}`;
    }
});
