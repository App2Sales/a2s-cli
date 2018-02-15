// import liraries
import React, { Component } from 'react';
import {
    View,
    Text,
    Modal,
    Image,
    TouchableOpacity,
    TextInput,
    ScrollView,
    Alert,
    AsyncStorage
} from 'react-native';
import styles from './styles';
import icons from './config';
import feedback from './feedback';

// create a component
class App2SalesFeedback extends Component {
    constructor(props) {
        super(props);
        this.state = {
            rating: 5,
            showFeedbackForm: true,
            showRatingForm: false,
            showSubjectOptions: false,
            showLastMessage: false,
            showChangeLog: false,
            comment: '',
            subjectText: 'Selecione o assunto',
            subjectIndex: -1,
            hasChangeLog: false,
            options: [
                'Quero fazer um elogio',
                'Encontrei uma falha',
                'Encontrei uma falha',
                'Achei algo difícil',
                'Outro'
            ],
            changelog: [],
            lastVersion: ''
        };
    }

    componentWillMount() {
        feedback.setProject(this.props.project, this.props.baseUrl);
    }

    componentDidMount() {
        // AsyncStorage.setItem('@lastVersion', '');

        feedback.getSubjects().then((snapshot) => {
            const options = snapshot.map(doc => doc.name);
            if (options.length > 0) this.setState({ options });
        }).catch(error => console.log('error', error));

        // read changelog from firestore
        feedback.getChangeLog().then((snapshot) => {
            const changelog = snapshot;
            // only proceed if there is changelog from firestore
            if (!changelog) return;

            this.setState({ changelog });
            // read lastVersion from Async
            AsyncStorage.getItem('@lastVersion', (error, result) => {
                // check if user has ever seen changelogs
                if (result) {
                    const lastVersion = parseInt(result, 10);
                    // check if user last version matchs last version on firestore
                    if (changelog[0].versionNumber <= lastVersion) {
                        // if it does we dont need to show changelog
                        this.setState({ hasChangeLog: false });
                    } else {
                        // otherwise we must make last version from user visible on state
                        this.setState({
                            hasChangeLog: true,
                            lastVersion,
                            showFeedbackForm: false,
                            showChangeLog: true
                        });
                    }
                } else if (changelog[0]) { // if there is any log to show
                    // in case user never saw any changelog
                    this.setState({
                        hasChangeLog: true,
                        showChangeLog: true,
                        showFeedbackForm: false
                    });
                }
            });
        }).catch(error => console.log('error', error));
    }

    setSubject = (subjectIndex, subjectText) => {
        this.setState({
            subjectIndex,
            subjectText,
            showSubjectOptions: false,
            showFeedbackForm: true
        });
    }

    validate = () => {
        if (this.state.subjectIndex === -1) {
            Alert.alert('Atenção', this.props.noSubjectError);
            return;
        }

        if (this.state.comment === '') {
            Alert.alert('Atenção', this.props.noCommentsError);
            return;
        }

        this.setState({
            showRatingForm: true,
            showFeedbackForm: false
        });
    }

    sendReport = () => {
        const { comment, subjectText, rating } = this.state;
        feedback.postFeedback(subjectText, comment, rating, this.props.user)
            .then(result => console.log('result', result))
            .catch((error) => {
                console.log('Erro: ', error);
            });
        this.setState({
            showRatingForm: false,
            showLastMessage: true
        });
    }

    closeFeedBack = () => {
        this.setState({
            showFeedbackForm: true,
            subjectText: 'Selecione o assunto',
            subjectIndex: -1,
            showLastMessage: false,
            showChangeLog: false,
            hasChangeLog: false,
            comment: ''
        });
        if (this.state.changelog[0]) {
            AsyncStorage.setItem('@lastVersion', `${this.state.changelog[0].versionNumber}`);
        }
        this.props.onCancel();
    }

    renderStars = () => {
        const stars = [];
        for (let i = 0; i < 5; i++) {
            stars.push((
                <TouchableOpacity
                    key={i}
                    onPress={() => this.setState({ rating: i + 1 })}>
                    <Image
                        source={icons.star}
                        style={styles.stars}
                        tintColor={(this.state.rating > i) ?
                            '#FFE04B' : '#595959'} />
                </TouchableOpacity>));
        }
        return stars;
    }

    renderChangeLog = () => {
        const { changelog, lastVersion } = this.state;
        return (
            <View style={styles.ratingContainer}>
                <Text style={styles.title}>Novidades e atualizações</Text>
                <ScrollView>
                    {changelog.map((item, index, array) => {
                        let separator = null;
                        if (item.versionNumber > lastVersion || lastVersion === '') {
                            if (index > 0) { // render separator when
                                // changelog is not the first element, only if previous
                                // item has a different versionName
                                separator = item.versionName !== array[index - 1].versionName ?
                                    (
                                        <View style={styles.changelogSeparatorContainer}>
                                            <View style={styles.changelogSeparator} />
                                            <Text style={styles.changelogVersion}>
                                                versão {item.versionName}
                                            </Text>
                                            <View style={styles.changelogSeparator} />
                                        </View>
                                    ) : null;
                            } else { // render first separator, on index 0
                                separator = (
                                    <View style={styles.changelogSeparatorContainer}>
                                        <View style={styles.changelogSeparator} />
                                        <Text style={styles.changelogVersion}>
                                            versão {item.versionName}
                                        </Text>
                                        <View style={styles.changelogSeparator} />
                                    </View>
                                );
                            }
                            return (
                                <View key={index}>
                                    {separator}
                                    <View style={styles.changelogCard}>
                                        <View style={styles.changelogHeader} >
                                            <Text style={styles.changelogTitle}>{item.title}</Text>
                                            <Text style={styles.changelogDate}>{item.date}</Text>
                                        </View>
                                        <Text style={styles.changelogText}>{item.text}</Text>
                                    </View>
                                </View>
                            );
                        }
                        return null;
                    })}
                </ScrollView>
                <TouchableOpacity onPress={this.closeFeedBack} >
                    <View style={styles.lastButton} >
                        <Text style={styles.lastButtonText}>Entendi!</Text>
                    </View>
                </TouchableOpacity>
            </View>
        );
    }

    renderLastMessage = () => (
        <View style={styles.ratingContainer}>
            <Text style={styles.title}>Obrigado!</Text>
            <Image source={icons.emoji} style={styles.emoji} />
            <Text style={styles.lastMessage} >
                Recebemos seu feedback e ele está em análise.
            </Text>
            <TouchableOpacity
                style={styles.lastButtonContainer}
                onPress={this.closeFeedBack} >
                <View style={styles.lastButton} >
                    <Text style={styles.lastButtonText}>Entendi!</Text>
                </View>
            </TouchableOpacity>
        </View>
    );

    renderRatingContainer = () => (
        <View style={styles.ratingContainer}>
            <Text style={styles.title}> Que tal avaliar sua experiência? </Text>
            <View style={styles.starsContainer}>
                {this.renderStars()}
            </View>
            <View style={styles.buttonsContainer}>
                <TouchableOpacity onPress={() => this.sendReport()}>
                    <View style={styles.button} >
                        <Text style={styles.sendButton}>ENVIAR</Text>
                    </View>
                </TouchableOpacity>
            </View>
        </View>
    );

    renderFeedbackForm = () => (
        <View style={styles.formContainer}>
            <View style={styles.fields}>
                <View style={styles.fieldsContainer} >
                    <Text style={styles.title}>
                        {this.props.feedbackFormTitle}
                    </Text>
                    <TouchableOpacity onPress={() => this.setState({
                        showSubjectOptions: true,
                        showFeedbackForm: false
                    })}>
                        <View style={styles.selectContainer}>
                            <Text style={styles.selectText}>{this.state.subjectText}</Text>
                            <View style={styles.selectedDropIcon} />
                        </View>
                    </TouchableOpacity>
                    <TextInput
                        multiline
                        textAlignVertical={'top'}
                        numberOfLines={3}
                        underlineColorAndroid={'transparent'}
                        style={styles.textArea}
                        onChangeText={text => this.setState({ comment: text })}
                        value={this.state.comment}
                        placeholder={this.props.commentPlaceholder} />
                    <View style={styles.buttonsContainer}>
                        <TouchableOpacity
                            style={styles.button}
                            onPress={this.props.onCancel}>
                            <Text style={styles.cancelButton}>CANCELAR</Text>
                        </TouchableOpacity>
                        <TouchableOpacity
                            style={styles.button}
                            onPress={() => this.validate()} >
                            <Text style={styles.sendButton}>ENVIAR</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        </View>
    );

    renderSubjectOptions = () => {
        const { options } = this.state;
        const { subjectIndex } = this.state;

        return (
            <View style={[styles.formContainer, styles.optionsModal]}>
                <View style={styles.fields}>
                    <Text style={styles.title}>
                        Selecione o assunto
                    </Text>
                    <View style={styles.optionsContainer}>
                        {options.map((item, index, array) => (
                            <TouchableOpacity
                                key={index}
                                onPress={() => this.setSubject(index, item)}>
                                <View
                                    style={[
                                        styles.option,
                                        (index === (array.length - 1)) ? styles.lastOption : null]}>
                                    {subjectIndex === index ?
                                        <Image
                                            source={icons.circleCheck}
                                            style={styles.selectedOptionIcon} /> :
                                        <View style={styles.optionIcon} />
                                    }
                                    <Text
                                        style={subjectIndex === index ?
                                            styles.selectedOptionText :
                                            styles.optionText}>{item}
                                    </Text>
                                </View>
                            </TouchableOpacity>
                        ))}
                    </View>
                </View>
            </View>
        );
    }

    render() {
        const {
            showRatingForm,
            showSubjectOptions,
            showFeedbackForm,
            showLastMessage,
            showChangeLog,
            hasChangeLog
        } = this.state;
        return (
            <Modal
                visible={this.props.isVisible || hasChangeLog}
                transparent
                onRequestClose={() => { }} >
                <View style={styles.container}>
                    {showChangeLog ? this.renderChangeLog() : null}
                    {showRatingForm ? this.renderRatingContainer() : null}
                    {showSubjectOptions ? this.renderSubjectOptions() : null}
                    {showFeedbackForm ? this.renderFeedbackForm() : null}
                    {showLastMessage ? this.renderLastMessage() : null}
                </View>
            </Modal>
        );
    }
}

App2SalesFeedback.defaultProps = {
    feedbackFormTitle: 'O que está achando do aplicativo?',
    commentPlaceholder: 'Gostaria de deixar um comentário?',
    noCommentsError: 'Você precisa fazer algum comentário',
    noSubjectError: 'Você precisa escolher um assunto',
    user: {}
};

// make this component available to the app
export default App2SalesFeedback;
