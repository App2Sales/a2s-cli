const styles = {
    container: {
        flex: 1,
        backgroundColor: '#000000CC',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 20
    },
    title: {
        fontSize: 18,
        marginBottom: 20,
        textAlign: 'center'
    },
    formContainer: {
        backgroundColor: '#FFF',
        borderRadius: 10,
        padding: 40,
        width: '100%'
    },
    optionsModal: {
        paddingHorizontal: 0
    },
    ratingContainer: {
        backgroundColor: '#FFF',
        borderRadius: 10,
        alignItems: 'center',
        justifyContent: 'center',
        padding: 40
    },
    fields: {
        flexDirection: 'column'
    },
    selectContainer: {
        borderColor: '#E5E5E5',
        borderWidth: 1,
        backgroundColor: '#F7F7F7',
        paddingHorizontal: 16,
        paddingVertical: 8,
        borderRadius: 20,
        width: '100%',
        marginBottom: 20,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between'
    },
    selectOption: {
        backgroundColor: '#F7F7',
        flexDirection: 'row'
    },
    selectText: {},
    textArea: {
        paddingHorizontal: 16,
        paddingVertical: 16,
        width: '100%',
        height: 200,
        backgroundColor: '#F7F7F7',
        borderColor: '#E5E5E5',
        borderRadius: 20,
        borderWidth: 1,
        marginBottom: 20
    },
    buttonsContainer: {
        marginTop: 20,
        flexDirection: 'row',
        justifyContent: 'space-between'
    },
    optionsContainer: {
        marginTop: 20
    },
    option: {
        flexDirection: 'row',
        alignItems: 'center',
        marginTop: 5,
        marginBottom: 5,
        paddingBottom: 10,
        paddingHorizontal: 40,
        borderBottomWidth: 1,
        borderColor: '#E5E5E5'
    },
    lastOption: {
        borderBottomWidth: 0
    },
    optionText: {
        marginLeft: 20
    },
    selectedOptionText: {
        fontWeight: 'bold'
    },
    optionIcon: {
        height: 20,
        width: 20,
        borderWidth: 1,
        marginRight: 10,
        borderColor: '#E5E5E5',
        borderRadius: 10
    },
    selectedOptionIcon: {
        height: 20,
        width: 20,
        tintColor: '#53d854',
        marginRight: 10
    },
    selectedDropIcon: {
        width: 0,
        height: 0,
        backgroundColor: 'transparent',
        borderStyle: 'solid',
        borderTopWidth: 8,
        borderRightWidth: 6,
        borderLeftWidth: 6,
        borderBottomWidth: 0,
        borderTopColor: '#77909c',
        borderRightColor: 'transparent',
        borderBottomColor: 'transparent',
        borderLeftColor: 'transparent'
    },
    cancelButton: {
        color: '#FF0068'
    },
    sendButton: {
        color: '#84039E'
    },
    starsContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
        height: 40,
        width: 100
    },
    stars: {
        width: 25,
        height: 25,
        marginHorizontal: 5
    },
    lastMessage: {
        textAlign: 'center',
        marginTop: 20
    },
    lastButton: {
        backgroundColor: '#4707FF',
        paddingHorizontal: 30,
        paddingVertical: 10,
        borderRadius: 25,
        marginTop: 20
    },
    lastButtonText: {
        color: '#FFFFFF'
    },
    emoji: {
        width: 70,
        height: 70,
        tintColor: '#77909c'
    },
    changelogCard: {
        backgroundColor: '#F7F7F7',
        borderColor: '#E5E5E5',
        padding: 15,
        marginBottom: 15,
        borderRadius: 15,
        borderWidth: 1,
        flexDirection: 'column'
    },
    changelogHeader: {
        flexDirection: 'row',
        marginBottom: 10
    },
    changelogTitle: {
        flex: 2,
        fontSize: 14
    },
    changelogDate: {
        fontSize: 11,
        flex: 1,
        fontWeight: 'bold',
        textAlign: 'right'
    },
    changelogText: {
        fontSize: 12
    },
    changelogSeparatorContainer: {
        marginBottom: 15,
        alignItems: 'center',
        width: '100%',
        flexDirection: 'row'
    },
    changelogSeparator: {
        borderColor: '#BBBBBB',
        borderBottomWidth: 1,
        flex: 2
    },
    changelogVersion: {
        textAlign: 'center',
        color: '#BBBBBB',
        backgroundColor: '#FFF',
        flex: 2
    }
};
export default styles;
