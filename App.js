import React from 'react';
import { SafeAreaView, StyleSheet, Text, View, Image, TouchableOpacity, ScrollView } from 'react-native';

const App = () => {
    return (
        <SafeAreaView style={styles.container}>
            <ScrollView contentContainerStyle={styles.scrollContainer}>
                <View style={styles.header}>
                    <Text style={styles.title}>Neko Puk3</Text>
                    <Text style={styles.subtitle}>Android приложение</Text>
                </View>

                <View style={styles.content}>
                    <Image
                        source={{ uri: 'https://cdn-icons-png.flaticon.com/512/1946/1946429.png' }}
                        style={styles.logo}
                    />

                    <Text style={styles.welcomeText}>
                        Добро пожаловать в приложение Neko Puk3!
                    </Text>

                    <View style={styles.featureCard}>
                        <Text style={styles.featureTitle}>Основные функции:</Text>
                        <Text style={styles.featureItem}>• Простой и удобный интерфейс</Text>
                        <Text style={styles.featureItem}>• Адаптивный дизайн</Text>
                        <Text style={styles.featureItem}>• Быстрая работа</Text>
                        <Text style={styles.featureItem}>• Поддержка Android</Text>
                    </View>

                    <TouchableOpacity style={styles.button}>
                        <Text style={styles.buttonText}>Начать работу</Text>
                    </TouchableOpacity>

                    <View style={styles.infoBox}>
                        <Text style={styles.infoText}>
                            Версия: 1.0.0{'\n'}
                            Сборка: 2025.02.22
                        </Text>
                    </View>
                </View>
            </ScrollView>
        </SafeAreaView>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#f5f5f5',
    },
    scrollContainer: {
        flexGrow: 1,
    },
    header: {
        backgroundColor: '#6200ee',
        padding: 20,
        alignItems: 'center',
    },
    title: {
        fontSize: 28,
        fontWeight: 'bold',
        color: 'white',
    },
    subtitle: {
        fontSize: 16,
        color: 'rgba(255,255,255,0.8)',
        marginTop: 5,
    },
    content: {
        flex: 1,
        padding: 20,
        alignItems: 'center',
    },
    logo: {
        width: 120,
        height: 120,
        marginVertical: 20,
    },
    welcomeText: {
        fontSize: 18,
        textAlign: 'center',
        marginBottom: 20,
        color: '#333',
    },
    featureCard: {
        backgroundColor: 'white',
        borderRadius: 10,
        padding: 20,
        marginBottom: 20,
        width: '100%',
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.1,
        shadowRadius: 4,
        elevation: 3,
    },
    featureTitle: {
        fontSize: 16,
        fontWeight: 'bold',
        marginBottom: 10,
        color: '#6200ee',
    },
    featureItem: {
        fontSize: 14,
        marginBottom: 5,
        color: '#555',
    },
    button: {
        backgroundColor: '#6200ee',
        paddingVertical: 15,
        paddingHorizontal: 40,
        borderRadius: 25,
        marginVertical: 20,
    },
    buttonText: {
        color: 'white',
        fontSize: 16,
        fontWeight: 'bold',
    },
    infoBox: {
        marginTop: 20,
        padding: 15,
        backgroundColor: '#e8e8e8',
        borderRadius: 8,
        width: '100%',
    },
    infoText: {
        fontSize: 14,
        color: '#666',
        textAlign: 'center',
    },
});

export default App;