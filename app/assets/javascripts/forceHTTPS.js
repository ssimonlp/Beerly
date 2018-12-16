if (window.location.protocol === 'http:' && window.location.hostname !== 'localhost') {
    window.location = window.location.href.replace('http:', 'https:');
};