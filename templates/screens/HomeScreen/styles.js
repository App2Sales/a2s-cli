import { colors, globalStyles } from '../../config';

const styles = {
    ...globalStyles,
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: colors.backgroundScreens
    },
    icon: {
        height: 30,
        width: 30,
        resizeMode: 'contain'
    }
};

export default styles;
