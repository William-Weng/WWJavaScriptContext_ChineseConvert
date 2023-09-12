function simplifiedChinese(text) {
    const converter = OpenCC.Converter({ from: 'tw', to: 'cn' });
    return converter(text)
}

function traditionalChinese(text) {
    const converter = OpenCC.Converter({ from: 'cn', to: 'tw' });
    return converter(text)
}
